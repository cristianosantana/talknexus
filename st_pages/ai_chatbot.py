from tools.configuracao_logger import ConfiguracaoLogger
from tools.ollama_api import OllamaAPI
from tools.conversational_chain_factory import ConversationalChainFactory
from tools.stream_handler import StreamHandler
from tools.global_variables import GlobalVariables
from tools.smart_controller import SmartController
import streamlit as st
from tools.search_for_tables_mentioned_in_the_question import SearchForTablesMentionedInTheQuestion
import yaml

class AiChatbot:
    """
    Responsavel por mediar a conversa entre usuario e modelo llm
    """
    logger = ConfiguracaoLogger
    logger.configure_logger()
    ollama_api = OllamaAPI
    global_variables = GlobalVariables
    smart_controller = SmartController
    search_tables = SearchForTablesMentionedInTheQuestion()

    def __init__(self):
        self.run()

    def run(self):
        """
        Main function to run the Streamlit chat interface.

        Initializes UI components, manages conversation state, handles model selection,
        and processes chat interactions. Implements real-time streaming of model responses
        and maintains chat history.
        """
        # st.markdown('''
        # <div class="header-container">
        #     <p class="header-subtitle">🤖 Converse com modelos de linguagem de última geração</p>
        # </div>
        # ''', unsafe_allow_html=True)

        # Initialize session state
        if 'messages' not in st.session_state:
            st.session_state.messages = []
        if 'conversation' not in st.session_state:
            st.session_state.conversation = None
        if 'conversation_analyst' not in st.session_state:
            st.session_state.conversation_analyst = None

        # self.global_variables.model_name = self.model_selection()
        self.global_variables.model_name = "gpt-4o-mini"
        self.initialize_conversation(
            self.global_variables.model_name, self.global_variables.prompt_query_builder)

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
            with st.chat_message("system"):
                self.generate_display_assistant_response(
                    st.session_state.conversation, st.session_state.messages, prompt, True)
                if self.global_variables.response != None:
                    # st.session_state.messages = []
                    # st.session_state.conversation = None
                    self.global_variables.model_name = "gpt-4o-mini"
                    self.initialize_conversation_analyst(
                        self.global_variables.model_name, self.global_variables.prompt_format_response)
                    prompt_response_llm = f"Faça uma tabela com os dados a seguir: {
                        self.global_variables.response}"
                    self.generate_display_assistant_response(
                        st.session_state.conversation_analyst, st.session_state.messages, prompt_response_llm, False)

    def generate_display_assistant_response(self, conversation, messages, message, run_smart_controller=False):
        """ Generate and display assistant response """
        # clear to response_placeholder
        response_placeholder = st.empty()
        # clear to global_variables.response
        self.global_variables.response = None

        try:
            # Create a new stream handler for this response
            stream_handler = StreamHandler(response_placeholder)

            # Temporarily add stream handler to the conversation
            conversation.llm.callbacks = [stream_handler]

            # Generate response
            # response = conversation.run(history=messages, input=message)
            response = conversation.run(message)

            if run_smart_controller:
                self.smart_controller.handler(self.smart_controller, response)

            # Clear the stream handler after generation
            conversation.llm.callbacks = []

            self.add_message_history(messages, "system", response)

        except Exception as e:
            error_message = f"Error generating response: {str(e)}"
            response_placeholder.error(error_message)
            self.add_message_history(messages, "system", error_message)

    def add_message_history(self, messages, user, menssage):
        """
        Add message to history
        """
        messages.append({"role": user, "content": menssage})

    def initialize_conversation(self, model_name, prompt):
        """ Initialize conversation if needed """
        if st.session_state.conversation is None:
            conversational_chain_factory = ConversationalChainFactory
            st.session_state.conversation = conversational_chain_factory.get_conversation_chain_openai(
                model_name, prompt)

    def initialize_conversation_analyst(self, model_name, prompt):
        """ Initialize conversation if needed """
        if st.session_state.conversation_analyst is None:
            conversational_chain_factory = ConversationalChainFactory
            st.session_state.conversation_analyst = conversational_chain_factory.get_conversation_chain_openai(
                model_name, prompt)

    def model_selection(self):
        """Get available models and Model selection """
        # Get available models
        models = self.ollama_api.get_ollama_models()
        if not models:
            st.warning(
                f"Ollama não está em execução. Certifique-se de ter Ollama API instalado")
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
