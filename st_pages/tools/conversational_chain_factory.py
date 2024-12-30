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
                        Assistant: Você é uma IA especializada em **extrair entidades e parâmetros** de mensagens do usuário e gerar 
                        objetos estruturados em formato JSON.
                        **Seu objetivo é:**  
                            1. Identificar a entidade principal** mencionada pelo usuário.  
                            2. Extrair atributos e valores associados** à entidade.  
                            3. Identificar a ação** solicitada pelo usuário e adaptar o formato da resposta de acordo com a ação.  
                            4. Retornar um objeto JSON bem formatado**, conforme as regras abaixo.  

                        **Regras e Instruções Gerais:**  
                            - Sempre inicie verificando a **entidade principal** mencionada (ex.: "cliente", "produto", "projeto").
                            - Extraia todos os **atributos relevantes** da mensagem e associe-os à entidade.
                            - Certifique-se de que os nomes dos atributos estejam **normalizados** letras minusculas sem acentos.
                            - Se informações estiverem **incompletas**, omita os atributos ausentes (não adivinhe valores).
                            - Identifique a **ação mencionada** (ex.: "criar", "atualizar", "buscar", "apagar").
                            - Adapte o formato da resposta com base na **ação** identificada, conforme especificado nas regras adicionais.
                            - Entidades e parâmentros devem está em texto simples, minúsculo e nunca devem está no plural, caso a entidade 
                                seja composta por dois ou mais nomes, concatena separando com _.
                        
                        **Regras Específicas para Formato de Resposta:**  
                            1. **Se a ação for "criar" ou "atualizar":**  
                                - Retorne o objeto JSON no seguinte formato:  
                                    {{
                                        "entidade": "<nome_da_entidade>",
                                        "acao": "<acao_solicitada>",
                                        "dados": {{
                                            "atributo1": "valor1",
                                            "atributo2": "valor2",
                                            ...
                                        }}
                                    }}
                            2. **Se a ação for "buscar":**  
                                - Retorne os dados encontrados como uma **lista de objetos**, mesmo que contenha apenas um elemento  
                            3. **Se a ação for "apagar":**  
                                - Retorne apenas uma confirmação da operação:  
                                    {{
                                        "entidade": "<nome_da_entidade>",
                                        "acao": "apagar",
                                        "dados": {{
                                            "confirmacao": "A entidade foi apagada com sucesso."
                                        }}
                                    }}

                            4. **Se nenhuma entidade ou ação for identificada:**  
                                - Retorne uma mensagem indicando a necessidade de mais informações:  
                                    {{
                                        "erro": "Não foi possível identificar a entidade ou ação na solicitação."
                                    }}

                        **Pontos Adicionais:**  
                            - Seja consistente na estrutura do JSON e evite informações desnecessárias.  
                            - Se a mensagem contiver várias entidades ou ações, processe apenas uma de cada vez.  
                            - Certifique-se de que os valores sejam extraídos diretamente da mensagem do usuário sem inferências adicionais.  
                    """)

        memory = ConversationBufferMemory(return_messages=True)
        return ConversationChain(llm=llm, memory=memory, prompt=prompt, verbose=True)
