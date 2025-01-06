from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory
from langchain.prompts import PromptTemplate
from langchain_community.llms import Ollama

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
            num_ctx=40960
        )

        prompt = PromptTemplate(
            input_variables=["history", "input"], 
            template=prompt)

        memory = ConversationBufferMemory(return_messages=True)
        return ConversationChain(llm=llm, memory=memory, prompt=prompt, verbose=True)
