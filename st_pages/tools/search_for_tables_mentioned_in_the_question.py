import json

class SearchForTablesMentionedInTheQuestion:
    
    def __init__(self):
        print("SearchForTablesMentionedInTheQuestion initialized.")  

    def load_dictionary(self, dictionary):
        """Carrega o dicionário de tabelas do arquivo JSON."""
        with open(dictionary, "r", encoding="utf-8") as f:
            return json.load(f)

    def search_relevant_tables(self, request):
        """Busca todas as tabelas relevantes para a pergunta do usuário."""
        dictionary = self.load_dictionary("schema_database/dictionary.json")
        tables_used = set()

        # 1️⃣ Identificar tabelas mencionadas na pergunta
        for tabela in dictionary:
            if tabela in request.lower():
                tables_used.add(tabela)

        # 2️⃣ Adicionar tabelas relacionadas (chaves estrangeiras)
        related_tables = set()
        for tabela in tables_used:
            if "relacionamentos" in dictionary[tabela]:
                related_tables.update(dictionary[tabela]["relacionamentos"].keys())

        # 3️⃣ Unir tabelas mencionadas e relacionadas
        tabelas_finais = tables_used.union(related_tables)

        # 4️⃣ Montar dicionário filtered
        dictionary_filtered = {t: dictionary[t] for t in tabelas_finais}

        return dictionary_filtered

# 🎯 Exemplo de uso
# pergunta = "Qual foi o faturamento das empresas mês passado, levando em consideração a notas_fiscais emitidas?"
# resultado = search_relevant_tables(pergunta)
# print(json.dumps(resultado, indent=2, ensure_ascii=False))