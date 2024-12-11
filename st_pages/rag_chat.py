import streamlit as st
import requests
from langchain.callbacks.base import BaseCallbackHandler
from langchain.prompts import PromptTemplate
#from langchain_ollama import ChatOllama
from langchain_community.llms import Ollama
from langchain.schema import Document
from langchain.chains import RetrievalQA
from langchain.embeddings import HuggingFaceEmbeddings
from langchain.document_loaders import PyPDFLoader
from langchain.vectorstores import FAISS
from nltk.tokenize import sent_tokenize
import tempfile
import os
import logging

import warnings
warnings.filterwarnings("ignore", category=Warning)

class StreamHandler(BaseCallbackHandler):
    """
    Custom callback handler for streaming LLM responses token by token.
    """
    def __init__(self, container):
        self.container = container
        self.text = ""
        
    def on_llm_new_token(self, token: str, **kwargs):
        """
        Processes each new token from the LLM response stream.
        """
        try:
            self.text += token
            clean_text = self.text
            
            # Clean up any AIMessage formatting if present
            if "AIMessage" in clean_text:
                if "content=\"" in clean_text:
                    try:
                        clean_text = clean_text.split("content=\"")[1].rsplit("\"", 1)[0]
                    except IndexError:
                        pass
                
                clean_text = (clean_text.replace("AIMessage(", "")
                                      .replace(", additional_kwargs={}", "")
                                      .replace(", response_metadata={})", "")
                                      .replace('{ "data":' , "")
                                      .replace('}' , "")
                )
            
            # Update the display with cleaned text
            self.container.markdown(clean_text)
            
        except Exception as e:
            print(f"Warning in StreamHandler: {str(e)}")
            self.container.markdown(self.text)

class RAGChat:
    EMBEDDING_MODELS = {
        "bge-small": {
            "name": "BAAI/bge-small-en-v1.5",
            "description": "Optimized for retrieval tasks, good balance of speed/quality"
        },
        "bge-large": {
            "name": "BAAI/bge-large-en-v1.5",
            "description": "Highest quality, but slower and more resource intensive"
        },
        "minilm": {
            "name": "sentence-transformers/all-MiniLM-L6-v2",
            "description": "Lightweight, fast, good general purpose model"
        },
        "mpnet": {
            "name": "sentence-transformers/all-mpnet-base-v2",
            "description": "Higher quality, slower than MiniLM"
        },
        "e5-small": {
            "name": "intfloat/e5-small-v2",
            "description": "Efficient model optimized for semantic search"
        }
    }

    def __init__(self):
        self.vectorstore = None
    
    @staticmethod
    def _create_sentence_windows(text, window_size):
        """Creates overlapping sentence windows from input text.
        
        Args:
            text (str): Input text to be windowed
            
        Returns:
            list[str]: List of text windows, each containing 2*window_size+1 sentences
        """
        sentences = sent_tokenize(text)
        windows = []
        
        for i in range(len(sentences)):
            start = max(0, i - window_size)
            end = min(len(sentences), i + window_size + 1)
            window = sentences[start:end]
            windows.append(" ".join(window))
        
        return windows
    def process_pdfs(self, pdf_files, embedding_model="bge-small"):
        try:
            all_windows = []
            
            with tempfile.TemporaryDirectory() as temp_dir:
                for pdf_file in pdf_files:
                    temp_path = os.path.join(temp_dir, pdf_file.name)
                    with open(temp_path, "wb") as f:
                        f.write(pdf_file.getbuffer())
                    
                    loader = PyPDFLoader(temp_path)
                    documents = loader.load()
                    
                    all_windows = [Document(page_content=window) 
                                   for doc in documents 
                                   for window in self._create_sentence_windows(text=doc.page_content, 
                                                                               window_size=4)]
            
            embeddings = HuggingFaceEmbeddings(
                model_name=self.EMBEDDING_MODELS[embedding_model]["name"],
                model_kwargs={'device': 'cpu'},
                encode_kwargs={'normalize_embeddings': True}
            )
            
            self.vectorstore = FAISS.from_documents(documents=all_windows, embedding=embeddings)
            return len(all_windows)
            
        except Exception as e:
            logging.error(f"Error processing PDFs: {str(e)}")
            raise

    def get_retrieval_chain(self, ollama_model: str, stream_handler=None):
        # Set up Ollama LLM
        #llm = ChatOllama(
        #    model=model_name,
        #    temperature=0.2,
        #    base_url="http://localhost:11434",
            #format="json"  # Updated to use simple string format
        #)

        # Set up Ollama LLM
        llm = Ollama(
            model=ollama_model,
            temperature=0.2,
            base_url="http://localhost:11434",
            callbacks=[stream_handler] if stream_handler else None
            #system_prompt="You are a helpful AI assistant. Keep your answers brief and concise."
        )
        
        template = """
        Context: {context}
        Question: {question}
        
        Provide a detailed, well-structured answer based only on the above context.
        """
        
        prompt = PromptTemplate(
            template=template,
            input_variables=["context", "question"]
        )
        
        return RetrievalQA.from_chain_type(
            llm=llm,
            chain_type="stuff",
            retriever=self.vectorstore.as_retriever(search_kwargs={"k": 7}),
            return_source_documents=True,
            chain_type_kwargs={"prompt": prompt}
        )

def get_ollama_models() -> list:
    try:
        response = requests.get("http://localhost:11434/api/tags")
        if response.status_code == 200:
            models = response.json()
            return [model['name'] for model in models['models'] if 'failed' not in model['name'].lower()]
        return []
    except:
        return []

def init_session_state():
    """Initialize all session state variables."""
    if 'messages' not in st.session_state:
        st.session_state.messages = []
    if 'rag_chain' not in st.session_state:
        st.session_state.rag_chain = None
    if 'rag_system' not in st.session_state:
        st.session_state.rag_system = RAGChat()
    if 'show_chat' not in st.session_state:
        st.session_state.show_chat = False
    if 'last_experiment_name' not in st.session_state:
        st.session_state.last_experiment_name = None
    if 'processed_files' not in st.session_state:
        st.session_state.processed_files = False

def render_header():
    """Render the application header."""
    st.markdown('''
    <div class="header-container">
        <p class="header-subtitle">🔍 RAG - Powered PDF Chat Assistant</p>
    </div>
    ''', unsafe_allow_html=True)

def setup_model_selection():
    """Setup the embedding and LLM model selection interface."""
    
    models = get_ollama_models()
        if not models:
            st.error(f"Ollama is not running. Make sure to have Ollama API installed")
            return None, None, None
    
    col1, col2 = st.columns(2)
    with col1:
        embedding_model = st.selectbox(
            "Select Embedding Model:",
            list(RAGChat.EMBEDDING_MODELS.keys()),
            format_func=lambda x: f"{x} - {RAGChat.EMBEDDING_MODELS[x]['description']}"
        )
            
        llm_model = st.selectbox(
            "Select Language Model:",
            models,
            format_func=lambda x: f'🔮 {x}'
        )
    with col2:
        st.markdown("##### 📤 Upload Documents")
        uploaded_files = st.file_uploader(
            "Upload one or more PDF files:",
            type=['pdf'],
            accept_multiple_files=True,
            help="Select PDF files to analyze"
        )

        if uploaded_files:
            st.markdown(f"*{len(uploaded_files)} files selected*")

    return uploaded_files, embedding_model, llm_model

def process_documents(experiment_name, uploaded_files, embedding_model):
    """Process uploaded documents if conditions are met."""
    if experiment_name and uploaded_files and experiment_name != st.session_state.last_experiment_name:
        with st.spinner("📚 Processing documents..."):
            try:
                st.session_state.rag_system.process_pdfs(
                    uploaded_files,
                    embedding_model=embedding_model
                )
                st.success(f"✅ Successfully processed documents for experiment: {experiment_name}!")
                st.session_state.show_chat = True
                st.session_state.messages = []
                st.session_state.last_experiment_name = experiment_name
                st.session_state.processed_files = True
            except Exception as e:
                st.error(f"❌ Error processing documents: {str(e)}")
    elif experiment_name and not uploaded_files:
        st.error("Please upload PDF files first")

def handle_chat_interaction(llm_model):
    """Handle chat interface and interactions."""
    # Create chat input AFTER container to ensure proper rendering order
    chat_container = st.container()
    
    # Place chat input after history display
    prompt = st.chat_input("Ask about your documents")

    with chat_container:
        # Display chat history
        for message in st.session_state.messages:
            with st.chat_message(message["role"]):
                st.markdown(message["content"])
    
        # Handle new prompt
        if prompt and st.session_state.rag_system.vectorstore:
            if st.session_state.rag_system.vectorstore:
                process_chat_message(prompt, llm_model)
            else:
                st.warning("Please process documents first!")

def process_chat_message(prompt, llm_model):
    """Process a single chat message and generate response."""
    # Add user message to state and display it
    st.session_state.messages.append({"role": "user", "content": prompt})
    with st.chat_message("user"):
        st.markdown(prompt)
    
    # Create assistant message
    with st.chat_message("assistant"):
        response_placeholder = st.empty()
        stream_handler = StreamHandler(response_placeholder)
        
        try:
            retrieval_chain = st.session_state.rag_system.get_retrieval_chain(
                llm_model,
                stream_handler=stream_handler
            )
            
            response = retrieval_chain.invoke({
                "query": prompt
            })
            
            final_response = response["result"].strip()
            
            # Update message history
            st.session_state.messages.append({
                "role": "assistant",
                "content": final_response
            })
            
            # Ensure final response is displayed
            response_placeholder.markdown(final_response)
            
        except Exception as e:
            error_msg = f"Error generating response: {str(e)}"
            st.error(error_msg)
            st.session_state.messages.append({
                "role": "assistant",
                "content": error_msg
            })

def run():
    """Main application function."""
    init_session_state()
    
    # Check for Ollama first
    models = get_ollama_models()
    if not models:
        st.warning("Ollama is not running. Make sure to have Ollama API installed")
        return
    
    render_header()
    
    st.markdown("#### 📋 Configuration")
    
    # Setup model selection & Handle file upload
    uploaded_files, embedding_model, llm_model = setup_model_selection()
    if not llm_model:  # Ollama not running
        return
    
    # Get experiment name
    experiment_name = st.text_input(
        "📝 Name your Experiment",
        key="experiment_name",
        placeholder="Press Enter to Apply",
    )
    
    # Process documents
    process_documents(experiment_name, uploaded_files, embedding_model)
    
    # Show chat interface
    if st.session_state.show_chat:
        st.markdown("---")
        handle_chat_interaction(llm_model)

