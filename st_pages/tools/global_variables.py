import yaml

class GlobalVariables:
    """Variaveis globais do sistema"""

    def upload_file_yaml(file_path, file_name):
        response = yaml.safe_load(open(file_path, 'r'))
        return response[file_name]

    prompt_original = upload_file_yaml("./prompts/prompt_original.yaml", "PromptOriginal")
    prompt_format_response = upload_file_yaml("./prompts/format_response_v1.yaml", "FormatResponse")
    prompt_select_create_update_delete = upload_file_yaml("./prompts/select_create_update_delete.yaml", "SelectCreateUpdateDelete")
    prompt_query_builder = upload_file_yaml("./prompts/query_builder_v1.yaml", "QueryBuilder")
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
