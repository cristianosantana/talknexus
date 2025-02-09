import json

def carregar_dicionario():
    """Carrega o dicionário de tabelas do arquivo JSON."""
    with open("schema_database/dicionario.json", "r", encoding="utf-8") as f:
        return json.load(f)

def buscar_tabelas_relevantes(pergunta):
    """Busca todas as tabelas relevantes para a pergunta do usuário."""
    dicionario = carregar_dicionario()
    tabelas_usadas = set()

    # 1️⃣ Identificar tabelas mencionadas na pergunta
    for tabela in dicionario:
        if tabela in pergunta.lower():
            tabelas_usadas.add(tabela)

    # 2️⃣ Adicionar tabelas relacionadas (chaves estrangeiras)
    tabelas_relacionadas = set()
    for tabela in tabelas_usadas:
        if "relacionamentos" in dicionario[tabela]:
            tabelas_relacionadas.update(dicionario[tabela]["relacionamentos"].keys())

    # 3️⃣ Unir tabelas mencionadas e relacionadas
    tabelas_finais = tabelas_usadas.union(tabelas_relacionadas)

    # 4️⃣ Montar dicionário filtrado
    dicionario_filtrado = {t: dicionario[t] for t in tabelas_finais}

    return dicionario_filtrado

# 🎯 Exemplo de uso
pergunta = "Qual foi o faturamento das empresas mês passado, levando em consideração a notas_fiscais emitidas?"
resultado = buscar_tabelas_relevantes(pergunta)
print(json.dumps(resultado, indent=2, ensure_ascii=False))