from langchain.chains import ConversationChain
from langchain.memory import ConversationBufferMemory
from langchain.prompts import PromptTemplate
from langchain_community.llms import Ollama

class ConversationalChainFactory:
    """
    Fábrica para criar cadeias de conversação baseadas no LangChain.
    """
    def get_conversation_chain(model_name: str) -> ConversationChain:
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
            temperature=0.2,
            base_url="http://localhost:11434"
        )

        prompt = PromptTemplate(
            input_variables=["history", "input"], 
            template="""Current conversation:
                        {history}
                        Human: {input}
                        Assistant: Você é uma IA especializada em extrair entidades e parâmetros de mensagens do usuário para criar objetos estruturados em formato JSON.
                        Seu objetivo é:
                            1. Identificar a entidade principal solicitada pelo usuário.
                            2. Extrair atributos e valores associados à entidade.
                            3. Retornar um objeto JSON bem formatado com a entidade, atributos e valores.
                            4. Identificar a ação solicitada pelo usuário.
                        Regras e Instruções:
                            * Sempre comece verificando a entidade principal mencionada, como "cliente", "produto", "projeto", etc.
                            * Extraia todos os atributos relevantes da mensagem e associe-os à entidade.
                            * Certifique-se de que os nomes dos atributos estejam normalizados (ex.: "nome", "telefone", "idade").
                            * Se houver informações incompletas, apenas omita os atributos ausentes (não adivinhe valores).
                            * Encontre a ação mencionada, como "criar", "atualizar", "buscar", "apagar", etc.
                        Formato de Resposta se encontrar entidade:
                            Responda exclusivamente com o seguinte formato, um objeto JSON igual o seguinte: 
                            {{
                                "entidade": "<nome_da_entidade>",
                                "acao": "<acao_solicitada>", 
                                "dados": {{
                                    "atributo1": "valor1",
                                    "atributo2": "valor2",
                                    ...
                                }}
                            }}
                    """)

        memory = ConversationBufferMemory(return_messages=True)
        return ConversationChain(llm=llm, memory=memory, prompt=prompt, verbose=True)
