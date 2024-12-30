# Aqui está o código Python para processar a mensagem e criar um objeto JSON com as informações extraídas:

import json

def processar_mensagem(mensagem):
    # Inicializar os dados
    dados = {
        "entidade": "",
        "acao": "",
        "dados": {}
    }

    # Extrair entidade principal
    for item in mensagem:
        if item["nome"]:
            dados["entidade"] = item["nome"]

    # Extrair atributos e valores associados à entidade
    if dados["entidade"]:
        for item in mensagem:
            if item["nome"] == dados["entidade"]:
                for atributo, valor in item.items():
                    if atributo != "nome" and not isinstance(valor, str):
                        dados["dados"][atributo] = valor

    # Identificar ação solicitada
    for item in mensagem:
        if item["nome"]:
            for acao in ["criar", "atualizar", "buscar", "apagar"]:
                if acao in item.get("acao"):
                    dados["acao"] = acao
                    break

    # Adaptar formato da resposta com base na ação identificada
    if dados["acao"] == "criar" or dados["acao"] == "atualizar":
        dados["dados"]["nome"] = dados["entidade"]
        dados["dados"]["ativo"] = True
        dados["created_at"] = "2023-12-14T19:00:56.000000Z"
        dados["updated_at"] = "2023-12-14T19:00:56.000000Z"
    elif dados["acao"] == "buscar":
        dados["dados"] = [{"nome": dados["entidade"], "ativo": True, "created_at": "2023-12-14T19:00:56.000000Z", "updated_at": "2023-12-14T19:00:56.000000Z"}]
    elif dados["acao"] == "apagar":
        dados["dados"]["confirmacao"] = "A entidade foi apagada com sucesso."

    # Retornar objeto JSON
    return json.dumps(dados, indent=4)

# Teste do código
mensagem = [
    {"nome": "CLIENTE1", "ativo": True, "created_at": null, "updated_at": null, "deleted_at": null},
    {"nome": "PRODUTO1", "ativo": False, "created_at": null, "updated_at": null, "deleted_at": null},
    {"nome": "PROJETO1", "ativo": True, "created_at": null, "updated_at": null, "deleted_at": null}
]

print(processar_mensagem(mensagem))