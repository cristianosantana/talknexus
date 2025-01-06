import streamlit as st
import sys, os
sys.path.append(os.path.join(os.path.dirname(__file__)))
from tools.configuracao_logger import ConfiguracaoLogger
from tools.ollama_api import OllamaAPI
from tools.conversational_chain_factory import ConversationalChainFactory
from tools.stream_handler import StreamHandler
from tools.global_variables import GlobalVariables
from tools.smart_controller import SmartController

class AiChatbot:
    """
    Responsavel por mediar a conversa entre usuario e modelo llm
    """
    logger = ConfiguracaoLogger
    logger.configure_logger()
    ollama_api = OllamaAPI
    global_variables = GlobalVariables
    smart_controller = SmartController

    def __init__(self):
        self.run()

    def run(self):
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
        
        self.global_variables.model_name = self.model_selection()
        self.initialize_conversation(self.global_variables.model_name, self.global_variables.prompt_create_query)
        
        # Display chat history
        for message in st.session_state.messages:
            with st.chat_message(message["role"]):
                st.markdown(message["content"])

        # Handle new user input
        if prompt := st.chat_input(f"Fale com {self.global_variables.model_name}"):
            # Add user message to history
            self.add_message_history(st.session_state.messages, "user", prompt)
            with st.chat_message("user"):
                st.markdown(prompt)

            # Generate and display assistant response
            with st.chat_message("assistant"):
                self.generate_display_assistant_response(st.session_state.messages, prompt)
                # if self.global_variables.response != None:
                #     st.session_state.messages = []
                #     st.session_state.conversation = None
                #     self.global_variables.model_name = "llama3.2:3b"
                #     self.initialize_conversation(self.global_variables.model_name, self.global_variables.prompt_format_response)
                #     prompt_response_llm = f"Faça uma tabela com os dados do objeto a seguir: {self.global_variables.response}"
                #     self.generate_display_assistant_response(prompt_response_llm)

    def generate_display_assistant_response(self, messages, message, run_smart_api = False):
        """ Generate and display assistant response """
        # clear to response_placeholder
        response_placeholder = st.empty()
        # clear to global_variables.response
        self.global_variables.response = None
        
        try:
            # Create a new stream handler for this response
            stream_handler = StreamHandler(response_placeholder)
            
            # Temporarily add stream handler to the conversation
            st.session_state.conversation.llm.callbacks = [stream_handler]

            # Generate response
            response = st.session_state.conversation.run(message)
            
            if run_smart_api:
                self.smart_controller.handler(self.smart_controller, response)

            # Clear the stream handler after generation
            st.session_state.conversation.llm.callbacks = []
            
            self.add_message_history(messages, "assistant", response)
        
        except Exception as e:
            error_message = f"Error generating response: {str(e)}"
            response_placeholder.error(error_message)
            self.add_message_history(messages, "assistant", error_message)

    def add_message_history(self, messages, user, menssage):
        """
        Add message to history
        """
        messages.append({"role": user, "content": menssage})

    def initialize_conversation(self, model_name, prompt):
        """ Initialize conversation if needed """
        if st.session_state.conversation is None:
            conversational_chain_factory = ConversationalChainFactory
            st.session_state.conversation = conversational_chain_factory.get_conversation_chain(model_name, prompt)

    def model_selection(self):
        """Get available models and Model selection """
        # Get available models
        models = self.ollama_api.get_ollama_models()
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
                on_change=self.ollama_api.on_model_change,
                label_visibility="collapsed"
            )

        return model_name