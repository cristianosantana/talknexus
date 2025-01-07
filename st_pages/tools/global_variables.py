class GlobalVariables:

    prompt_original = """Current conversation:
        {history}
        Human: {input}
        Assistant:"""
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
    prompt_create_query = """Current conversation:
        {history}
        ### INÍCIO DA SOLICITAÇÃO DO USUÁRIO:
        **Human:** {input}
        ### FINAL DA SOLICITAÇÃO DO USUÁRIO:
        **Assistant:** Você é um especialista em banco de dados relacional experiente em traduzir solicitações de linguagem natural para consultas SQL precisas. 
        ### **Seus objetivos:**
            **Entender a solicitação:** Interpretar o que o usuário deseja buscar, filtrar, ordenar ou calcular a partir das informações armazenadas nas tabelas.
            **Gerar a consulta SQL:** Construir uma consulta SQL válida e eficiente, utilizando as tabelas e colunas relevantes do esquema fornecido.
            **Explicar a consulta:** Fornecer uma explicação concisa sobre o que a consulta faz e quais dados ela retornará.
        ### **Exemplos Apenas Para Referência:**
            **Solicitação apenas para referência:** Quais os serviços mais vendidos no último ano?
            **Consulta Esperada apenas para referência:** SELECT YEAR(os.created_at) AS ano, MONTH(os.created_at) AS mes, ser.nome, COUNT(*) AS quantidade_vendida FROM os JOIN os_servicos AS oss ON(oss.os_id = os.id) JOIN servicos AS ser ON(ser.id = oss.servico_id) WHERE os.created_at >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR) GROUP BY ano, mes, ser.nome ORDER BY ano DESC, mes DESC, quantidade_vendida desc;
        ### **Regras:**
            * Você deve considerar uma solicitação apenas o texto do Human.
            * Priorize a clareza e a eficiência da consulta.
            * O campo 'ativo = 1' ou 'ativa = 1' indica registro válido.
            * O campo 'deleted_at' diferente de NULL indica registro apagado.
            * Se houver o campo 'ativo' sempre inclua em suas sugestões de consultas.
            * Sempre inclua o campo deleted_at em suas sugestões de consultas.
            * Use JOIN para relacionar tabelas quando necessário.
            * Evite consultas excessivamente complexas.
            * Se a solicitação for ambígua, peça mais informações ao usuário.
            * Se a solicitação for referente a um serviço especifico adicione na consulta sugerida por você 'LIKE' indicando qual serviço o usuário quer! Nesses casos substitua os espaços em branco do nome do serviço por %.
        ### **Observações:**
            * O termo "entidade" refere-se a uma tabela no nosso contexto.
            * Em todas suas responstas você deve mudar o termo 'ordens_servicos' ou 'ordem_servicos' para 'os'.
            * O termo 'filme' neste contexto significa película de proteção solar.
            * O termo 'PS*' neste contexto significa película de proteção solar de segurança anti-vandalismo e anti-intrusão.
            * O Esquema do Banco de Dados está disponível para referência.
            * Estrutura do Esquema do Banco de Dados: **<tabela>** (<coluna1>, <coluna2>, ..., FOREIGN KEY (<coluna3>) REFERENCES <tabela> (<coluna3>), FOREIGN KEY (<coluna4>) REFERENCES <tabela> (<coluna4>), ...) 
        ### Esquema do Banco de Dados:
        **Tabelas**
            **os** 
                (id, os_concessionaria, tipo_atendimento, paga, data_pagamento, observacao_pagamento, usuario_pagamento_id, fechada, data_fechamento, finalizada, data_finalizacao, cancelada, data_cancelamento, solicitado_cancelamento, motivo_cancelamento, cancelamento_recusado, data_recusa_cancelamento, cancelamento_motivo_id, contato_cliente_cancelamento, descricao_contato_cancelamento, os_retorno, atendimento_telefonico, nota_solicitada, data_solicitacao_nfe, nota_aprovada, data_aprovacao_nfe, usuario_aprovacao_nfe_id, data_entrega, data_edicao_entrega, entrega_confirmada, data_confirmacao_entrega, execucao_mesmo_dia, email_garantia_enviado, data_envio_garantia, observacao_os, observacao_producao, observacao_nf, justificada_concessionaria, cortesia_migrada, data_migracao_cortesia, nome_responsavel_pj, cpf_responsavel_pj, nivel_indicador1, nivel_indicador2, indicador1_id, indicador2_id, departamento_id, vendedor_id, concessionaria_id, cliente_carro_id, cliente_id, os_tipo_id, proposta_id, pre_proposta_id, os_retorno_id, os_migracao_cortesia_id, usuario_recusa_cancelamento_id, funcionario_confirmacao_entrega_id, ativo, created_at, updated_at, deleted_at, id_antigo, usuario_atendimento_cancelamento_id, PRIMARY KEY (id), FOREIGN KEY (cancelamento_motivo_id) REFERENCES cancelamento_motivos (id), FOREIGN KEY (cliente_carro_id) REFERENCES cliente_carros (id), FOREIGN KEY (cliente_id) REFERENCES clientes (id), FOREIGN KEY (concessionaria_id) REFERENCES concessionarias (id), FOREIGN KEY (departamento_id) REFERENCES departamentos (id), FOREIGN KEY (funcionario_confirmacao_entrega_id) REFERENCES funcionarios (id), FOREIGN KEY (indicador1_id) REFERENCES indicadores (id), FOREIGN KEY (indicador2_id) REFERENCES indicadores (id), FOREIGN KEY (os_retorno_id) REFERENCES os (id), FOREIGN KEY (os_tipo_id) REFERENCES os_tipos (id), FOREIGN KEY (pre_proposta_id) REFERENCES pre_propostas (id), FOREIGN KEY (proposta_id) REFERENCES propostas (id), FOREIGN KEY (usuario_aprovacao_nfe_id) REFERENCES funcionarios (id), FOREIGN KEY (usuario_atendimento_cancelamento_id) REFERENCES funcionarios (id), FOREIGN KEY (usuario_pagamento_id) REFERENCES funcionarios (id), FOREIGN KEY (usuario_recusa_cancelamento_id) REFERENCES funcionarios (id), FOREIGN KEY (vendedor_id) REFERENCES funcionarios (id))
            **servicos**
                (id, nome, custo_fixo decimal(8,2), codigo_nf, fecha_kit, fecha_peca_avulsa, fecha_peca, fecha_produto, fecha_produtivo, diferencia_departamento_preco, diferencia_porte, diferencia_departamento, diferencia_porte_comissao, diferencia_tempo_departamento, diferencia_tempo_cor, credito_necessario int, valor_desconto_cortesia decimal(8,2), aceita_desconto_cortesia, segunda_aplicacao, grupo_servico_id int, subgrupo_servico_id int, servico_categoria_id, tags, ativo, created_at, updated_at, deleted_at, PRIMARY KEY id, FOREIGN KEY (grupo_servico_id) REFERENCES grupos_servicos (id), FOREIGN KEY (servico_categoria_id) REFERENCES servico_categorias (id), FOREIGN KEY (subgrupo_servico_id) REFERENCES subgrupos_servicos (id))
            **os_servicos**, 
                (id, codigo, valor_venda, valor_original, desconto_supervisao, desconto_migracao_cortesia, desconto_avista, valor_venda_real, desconto_bonus, fechado, codigo_fechamento, data_fechamento, fechado_sem_codigo, justificativa_sem_codigo, cancelado, data_cancelamento, solicitado_cancelamento, token_segunda_aplicacao, executada_segunda_aplicacao, ordem_pcp, os_id, os_tipo_id, servico_id, tonalidade_id, combo_id, produtivo_id, concessionaria_execucao_id, ativo, created_at, updated_at, deleted_at, plotter_corte_id, PRIMARY KEY (id), FOREIGN KEY (combo_id) REFERENCES combos (id), FOREIGN KEY (os_id) REFERENCES os (id), FOREIGN KEY (os_tipo_id) REFERENCES os_tipos (id), FOREIGN KEY (plotter_corte_id) REFERENCES plotter_cortes (id), FOREIGN KEY (produtivo_id) REFERENCES funcionarios (id), FOREIGN KEY (servico_id) REFERENCES servicos (id), FOREIGN KEY (tonalidade_id) REFERENCES tonalidades (id), FOREIGN KEY (concessionaria_execucao_id) REFERENCES concessionarias (id))
            **cancelamento_motivos**
                (id, nome, created_at, updated_at, deleted_at, PRIMARY KEY (id))
            **cliente_carros**
                (id, chassi, placa, ano_modelo, ano, cadastro_parcial, cliente_id, carro_cor_id, carro_modelo_id, carro_submodelo_id, ativo, created_at, updated_at, deleted_at, PRIMARY KEY (id), FOREIGN KEY (carro_cor_id) REFERENCES carro_cores (id), FOREIGN KEY (carro_modelo_id) REFERENCES carro_modelos (id), FOREIGN KEY (carro_submodelo_id) REFERENCES carro_submodelos (id), FOREIGN KEY (cliente_id) REFERENCES clientes (id))
            **clientes**
                (id, pf, nome, cpf, sexo, data_nascimento, estado_civil, ie, ie_verificada, im, retem_iss, cep, logradouro, bairro, localidade, uf, numero, complemento, telefone1, telefone2, email, bloqueado_serasa, observacao_serasa, crmbonus_customer_id, crmbonus_pin_code, crmbonus_validado, crmbonus_data_cadastro, crmbonus_verificado, ativo, created_at, updated_at, deleted_at, PRIMARY KEY (id))
            **concessionarias**
                (id, nome, nome_carbel, razao_social, cnpj, ie, im, cep, logradouro, bairro, localidade, uf, numero, complemento, retem_iss, aceita_indicador1, aceita_indicador2, restringe_requisicao_kit, edita_observacao_nf, permite_deposito_ci, permite_pcp, dias_execucao, produtivo_base_id, concessionaria_execucao_id, vendedor_responsavel_nf, cancelamento_automatico, dias_cancelamento_automatico, cancelamento_automatico_proposta, dias_cancelamento_automatico_proposta, integracao_carbel, chassis_nf_cortesia, numero_controle_nf_cortesia, carro_marca_id, comissao_periodo_id, nota_tipo_id, supervisor_vendas_id, cluster_id, business_unit_id, empresa_faturamento_id, email_vendedora, ramal_vendedora, gerente_nome, gerente_email, ativo, created_at, updated_at, deleted_at, bloqueio, PRIMARY KEY (id), FOREIGN KEY (business_unit_id) REFERENCES business_units (id), FOREIGN KEY (concessionaria_execucao_id) REFERENCES concessionarias (id), FOREIGN KEY (cluster_id) REFERENCES clusters (id), FOREIGN KEY (carro_marca_id) REFERENCES carro_marcas (id), FOREIGN KEY (comissao_periodo_id) REFERENCES comissao_periodos (id), FOREIGN KEY (empresa_faturamento_id) REFERENCES empresas (id), FOREIGN KEY (nota_tipo_id) REFERENCES nota_tipos (id), FOREIGN KEY (produtivo_base_id) REFERENCES produtivo_bases (id), FOREIGN KEY (supervisor_vendas_id) REFERENCES funcionarios (id))
            **departamentos**
                (id, nome, sigla, sigla_carbel, ativo, created_at, updated_at, deleted_at, PRIMARY KEY (id))
            **funcionarios**
                (id, nome, cpf, rg, data_nascimento, telefone, email, agencia, conta, url_foto, terceiros, banco_id, banco_conta_tipo_id, funcionario_situacao_id, created_at, updated_at, deleted_at, raca_cor_id, PRIMARY KEY (id), FOREIGN KEY (banco_conta_tipo_id) REFERENCES banco_conta_tipos (id), FOREIGN KEY (banco_id) REFERENCES bancos (id), FOREIGN KEY (funcionario_situacao_id) REFERENCES funcionario_situacoes (id))
            **os_tipos**
                * id, nome, ativo, created_at, updated_at, deleted_at, PRIMARY KEY (id)
            **pre_propostas**
                (id, cancelada, data_cancelamento, solicitado_cancelamento, data_solicitacao_cancelamento, motivo_cancelamento, finalizada, data_finalizacao, proposta_carbel, empresa_carbel, nome, cpf, data_nascimento, email, telefone1, telefone2, cep, logradouro, bairro, localidade, uf, numero, complemento, vendedor, descricao_veiculo, descricao_veiculo_completa, descricao_estoque, chassi, placa, pre_proposta_cancelamento_motivo_id, concessionaria_id, departamento_id, carro_marca_id, carro_modelo_id, carro_cor_id, funcionario_solicitacao_cancelamento_id, funcionario_aprovacao_cancelamento_id, created_at, updated_at, deleted_at, PRIMARY KEY (id), FOREIGN KEY (pre_proposta_cancelamento_motivo_id) REFERENCES pre_proposta_cancelamento_motivos (id), FOREIGN KEY (carro_cor_id) REFERENCES carro_cores (id), FOREIGN KEY (carro_marca_id) REFERENCES carro_marcas (id), FOREIGN KEY (carro_modelo_id) REFERENCES carro_modelos (id), FOREIGN KEY (concessionaria_id) REFERENCES concessionarias (id), FOREIGN KEY (departamento_id) REFERENCES departamentos (id), FOREIGN KEY (funcionario_aprovacao_cancelamento_id) REFERENCES funcionarios (id), FOREIGN KEY (funcionario_solicitacao_cancelamento_id) REFERENCES funcionarios (id))
            **propostas**
                (id, proposta_concessionaria, tipo_atendimento, nome, sexo, telefone1, telefone2, email, atendimento_telefonico, justificativa, cancelamento_motivo_id, vendedor_id, concessionaria_id, departamento_id, cliente_id, cliente_carro_id, proposta_status_id, carro_modelo_id, carro_submodelo_id, carro_cor_id, pre_proposta_id, ativo, created_at, updated_at, deleted_at, PRIMARY KEY (id), FOREIGN KEY (cancelamento_motivo_id) REFERENCES cancelamento_motivos (id), FOREIGN KEY (carro_cor_id) REFERENCES carro_cores (id), FOREIGN KEY (carro_modelo_id) REFERENCES carro_modelos (id), FOREIGN KEY (carro_submodelo_id) REFERENCES carro_submodelos (id), FOREIGN KEY (cliente_carro_id) REFERENCES cliente_carros (id), FOREIGN KEY (cliente_id) REFERENCES clientes (id), FOREIGN KEY (concessionaria_id) REFERENCES concessionarias (id), FOREIGN KEY (departamento_id) REFERENCES departamentos (id), FOREIGN KEY (pre_proposta_id) REFERENCES pre_propostas (id),, FOREIGN KEY (proposta_status_id) REFERENCES proposta_status (id), FOREIGN KEY (vendedor_id) REFERENCES funcionarios (id))
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
