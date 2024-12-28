class GlobalVariables:
    user_token = ""
    entities_columns_required = [
        {
            'entity': 'marca',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'vendas/cliente/criar',
                'atualizar': 'suporte/cliente/atualizar',
                'delete': 'vendas/cliente/delete'
            },
            'table': 'carro_marcas',
            'parameters': {
                'id': "",
                'nome': ""
            }
        },
        {
            'entity': 'carro',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'vendas/cliente/criar',
                'atualizar': 'suporte/cliente/atualizar',
                'delete': 'vendas/cliente/delete'
            },
            'table': 'carro_modelos',
            'parameters': {
                'id': "",
                'nome': "", 
                'carro_marca_id': ""
            }
        },
        {
            'entity': 'cliente',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'vendas/cliente/criar',
                'atualizar': 'suporte/cliente/atualizar',
                'delete': 'vendas/cliente/delete'
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
        },
        {
            'entity': 'fornecedor',
            'action': '',
            'method': '',
            'route': '',
            'routes': {
                'criar': 'vendas/cliente/criar',
                'atualizar': 'suporte/cliente/atualizar',
                'delete': 'vendas/cliente/delete'
            },
            'table': 'clientes',
            'parameters': {
                'id': "",
                'pj': "",
                'nome': "", 
                'cnpj': "", 
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