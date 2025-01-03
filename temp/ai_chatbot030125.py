import streamlit as st
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__)))
from tools.configuracao_logger import ConfiguracaoLogger
from tools.ollama_api import OllamaAPI
from tools.conversational_chain_factory import ConversationalChainFactory
from tools.stream_handler import StreamHandler
from tools.global_variables import GlobalVariables
from tools.smart_controller import SmartController

logger = ConfiguracaoLogger
logger.configure_logger()
ollama_api = OllamaAPI
global_variables = GlobalVariables
smart_controller = SmartController

def run():
    """
    Main function to run the Streamlit chat interface.
    
    Initializes UI components, manages conversation state, handles model selection,
    and processes chat interactions. Implements real-time streaming of model responses
    and maintains chat history.
    """
    st.markdown('''
    <div class="header-container">
        <p class="header-subtitle">🤖 Converse com modelos de linguagem de última geração</p>
    </div>
    ''', unsafe_allow_html=True)

    # Initialize session state
    if 'messages' not in st.session_state:
        st.session_state.messages = []
    if 'conversation' not in st.session_state:
        st.session_state.conversation = None
    if 'messages1' not in st.session_state:
        st.session_state.messages1 = []
    if 'conversation1' not in st.session_state:
        st.session_state.conversation1 = None

    # Get available models
    models = ollama_api.get_ollama_models()
    if not models:
        st.warning(f"Ollama não está em execução. Certifique-se de ter Ollama API instalado")
        return

    # Model selection
    st.subheader("Selecione o Modelo:")
    col1, _ = st.columns([2, 6])
    with col1:
        model_name = st.selectbox(
            "Model",
            models,
            format_func=lambda x: f'🔮 {x}',
            key="model_select",
            on_change=ollama_api.on_model_change,
            label_visibility="collapsed"
        )

    # Initialize conversation if needed
    if st.session_state.conversation is None:
        conversational_chain_factory = ConversationalChainFactory
        st.session_state.conversation = conversational_chain_factory.get_conversation_chain(model_name, global_variables.prompt_create_update_delete)

    # Display chat history
    for message in st.session_state.messages:
        with st.chat_message(message["role"]):
            st.markdown(message["content"])

    # Handle new user input
    if prompt := st.chat_input(f"Chat with {model_name}"):
        # Add user message to history
        st.session_state.messages.append({"role": "user", "content": prompt})
        with st.chat_message("user"):
            st.markdown(prompt)

        # Generate and display assistant response
        with st.chat_message("assistant"):
            response_placeholder = st.empty()
            global_variables.response = None
            
            try:
                # Create a new stream handler for this response
                stream_handler = StreamHandler(response_placeholder)
                
                # Temporarily add stream handler to the conversation
                st.session_state.conversation.llm.callbacks = [stream_handler]

                # Generate response
                response = st.session_state.conversation.run(prompt)
                
                smart_controller.handler(smart_controller, response)

                # Clear the stream handler after generation
                st.session_state.conversation.llm.callbacks = []
                
                # Add response to message history
                st.session_state.messages.append({"role": "assistant", "content": response})
            
            except Exception as e:
                error_message = f"Error generating response: {str(e)}"
                response_placeholder.error(error_message)
                st.session_state.messages.append({"role": "assistant", "content": error_message})

        st.info(f"resposta da api: {global_variables.response}")
        # if global_variables.response != None:
        with st.chat_message("assistant"):
            response_placeholder1 = st.empty()
            
            try:
                # Initialize conversation if needed
                if st.session_state.conversation1 is None:
                    conversational_chain_factory1 = ConversationalChainFactory
                    st.session_state.conversation1 = conversational_chain_factory1.get_conversation_chain(model_name, global_variables.prompt_format_response)
                
                # Create a new stream handler for this response
                stream_handler1 = StreamHandler(response_placeholder1)
                
                # Temporarily add stream handler to the conversation
                st.session_state.conversation1.llm.callbacks = [stream_handler1]

                # Generate response
                response1 = st.session_state.conversation1.run(f"Faça uma tabela com os dados do objeto a seguir: {global_variables.response}")
                
                # Clear the stream handler after generation
                st.session_state.conversation1.llm.callbacks = []
                
                # Add response to message history
                st.session_state.messages1.append({"role": "assistant", "content": response1})
            
            except Exception as e:
                error_message1 = f"Error generating response: {str(e)}"
                response_placeholder1.error(error_message1)
                st.session_state.messages1.append({"role": "assistant", "content": error_message1})
