from dotenv import load_dotenv
import os
from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory
from langchain.prompts import PromptTemplate
from langchain_community.llms import Ollama
from langchain_community.chat_models import ChatOpenAI


load_dotenv()  # Carrega as variáveis do arquivo .env
openai_api_key = os.getenv("OPENAI_API_KEY")

class ConversationalChainFactory:
    """
    Fábrica para criar cadeias de conversação baseadas no LangChain.
    """
    def get_conversation_chain(model_name: str, prompt: str) -> ConversationChain:
        """
        Initializes LangChain conversation chain with specified model.

        Args:
            model_name (str): Name of Ollama model to use

        Returns:
            ConversationChain: Configured conversation chain with memory and prompt template
        """

        # Set up Ollama LLM
        llm = Ollama(
            model=model_name,
            temperature=0.6,
            base_url="http://localhost:11434",
            tfs_z=2.0,
            top_k=10,
            top_p=0.5,
            mirostat=2,
            mirostat_tau=0.2,
            mirostat_eta=0.3,
            num_ctx=32368
        )

        prompt = PromptTemplate(
            input_variables=["history", "input"],
            template=prompt)

        memory = ConversationBufferMemory(return_messages=True)
        return ConversationChain(llm=llm, memory=memory, prompt=prompt, verbose=True)
    
    def get_conversation_chain_openai(model_name: str, prompt: str) -> ConversationChain:
        # Inicializando o modelo de chat OpenAI
        llm = ChatOpenAI(
            temperature=0.6,
            model=model_name,
            api_key=openai_api_key
        )

        # Definindo o template de prompt
        prompt = PromptTemplate(
            input_variables=["history", "input"],
            template=prompt
        )

        # Criando memória para rastrear histórico de conversas
        memory = ConversationBufferMemory(return_messages=True)

        # Criando a cadeia de conversa
        return ConversationChain(llm=llm, memory=memory, prompt=prompt, verbose=True)
