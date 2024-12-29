class GlobalVariables:
    user_token = ""
    entities_columns_required = [
        {
            'entity': 'marca',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'v3/admin/vehicles/brands',
                'atualizar': 'v3/admin/vehicles/brands',
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