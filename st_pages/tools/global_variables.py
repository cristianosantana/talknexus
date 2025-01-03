class GlobalVariables:
    
    prompt_select_create_update_delete = """Current conversation:
        {history}
        Human: {input}
        Assistant: Você é uma IA especializada em **extrair entidades e parâmetros** de mensagens do usuário e gerar 
        objetos estruturados em formato JSON.
        **Seu objetivo é:**  
            1. Identificar a **entidade principal** mencionada pelo usuário.  
            2. Extrair atributos e valores associados à entidade.  
            3. Identificar a **ação** solicitada pelo usuário e adaptar o formato da resposta de acordo com a ação.  
            4. Retornar um objeto JSON bem formatado, conforme as regras abaixo.  

        **Regras e Instruções Gerais:**  
            - Sempre inicie verificando a **entidade principal** mencionada (ex.: "cliente", "produto", "projeto").
            - Extraia todos os **atributos relevantes** da mensagem e associe-os à entidade.
            - Certifique-se de que os nomes dos atributos estejam **normalizados** letras minusculas sem acentos.
            - Se informações estiverem **incompletas**, omita os atributos ausentes (não adivinhe valores).
            - Identifique a **ação mencionada** (ex.: "criar", "atualizar", "buscar", "apagar").
            - Adapte o formato da resposta com base na **ação** identificada, conforme especificado nas regras adicionais.
            - Entidades e parâmentros devem está em texto simples, minúsculo e nunca devem está no plural, caso a entidade seja composta por dois ou mais nomes, concatena separando com _.
            - Sempre que encontrar entidade no plural mude-a para o singular! (ex: clientes muda para cliente, objetos muda para objeto)
        
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
                - Retorne a entidate e ação encontradas
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
    """
    prompt_format_response = """Current conversation:
        {history}
        Human: {input}
        Assistant: Você é um assistente especialista em processar dados. Dado um objeto JSON, sua tarefa é convertê-lo em uma tabela legível e bem formatada. 
        Use o formato Markdown para criar a tabela. Cada chave do objeto deve se tornar o título de uma coluna, e os valores correspondentes 
        devem preencher as linhas.
        
        **Seu objetivo é:**  
            1. Identificar o objeto mencionado.  
            2. Construir tabela apartir do objeto encontrado. 

        **Seu objetivo é:** converter objetos em tabela legível! Exemplo de Objeto JSON:
            {{
            "nome": "nome",
            "idade": idade,
            "profissão": "profissao"
            }}
        Tabela esperada:
            Nome	Idade	Profissão
            Nome	Idade	Profissão
    """
    user_token = ""
    response = None
    object_found = None
    model_name = None
    entities_columns_required = [
        {
            'entity': 'marca',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'v3/admin/vehicles/brands',
                'atualizar': 'v3/admin/vehicles/brands',
                'buscar': 'v3/admin/vehicles/brands',
                'delete': '#'
            },
            'table': 'carro_marcas',
            'parameters': {
                'id': "",
                'nome': ""
            }
        },
        {
            'entity': 'cliente',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': '#',
                'atualizar': 'suporte/cliente/atualizar',
                'delete': '#'
            },
            'table': 'clientes',
            'parameters': {
                'id': "",
                'pf': "",
                'nome': "", 
                'cpf': "", 
                'telefone1': "",
                'telefone2': "",
                'email': "",
                'cep': "",
                'logradouro': "",
                'numero': "",
                'bairro': "",
                'localidade': "",
                'uf': ""
            }
        }
    ]