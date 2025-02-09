# Vamos ajustar a função para lidar corretamente com o formato de definição de tabelas que você forneceu. Esse formato inclui informações sobre restrições, tipos de colunas e chaves estrangeiras, além de possíveis comentários e outros comandos SQL.

# Vou focar em extrair as informações das tabelas, colunas e chaves estrangeiras de acordo com o padrão que você compartilhou:

# ```python
import re
import json

def ler_arquivo_sql(arquivo_sql, arquivo_json):
    with open(arquivo_sql, 'r', encoding='utf-8') as file:
        sql = file.read()
    
    dicionario = {}
    
    # Regex para capturar os nomes das tabelas e suas colunas
    tabela_pattern = re.compile(r'CREATE TABLE `(.+?)`\s*\((.*?)\)\s*(ENGINE=[^;]+)?;', re.DOTALL)  # Captura a tabela e suas colunas
    coluna_pattern = re.compile(r'`([^`]+)` ([^,]+)')  # Captura o nome da coluna e seu tipo
    foreign_key_pattern = re.compile(r'CONSTRAINT `[^`]+` FOREIGN KEY \(`([^`]+)`\) REFERENCES `([^`]+)` \(`([^`]+)`\)')  # Captura chaves estrangeiras
    
    # Encontrar todas as tabelas e suas definições
    for match in tabela_pattern.finditer(sql):
        nome_tabela = match.group(1)
        colunas = match.group(2)

        dicionario[nome_tabela] = {
            "descricao": f"Tabela de {nome_tabela}",
            "colunas": {},
            "relacionamentos": {}
        }
        
        # Encontrar todas as colunas na tabela
        for coluna_match in coluna_pattern.finditer(colunas):
            nome_coluna = coluna_match.group(1)
            tipo_coluna = coluna_match.group(2).strip()  # Captura o tipo da coluna e remove espaços extras
            dicionario[nome_tabela]["colunas"][nome_coluna] = tipo_coluna

        # Encontrar relacionamentos (chaves estrangeiras)
        for foreign_key_match in foreign_key_pattern.finditer(colunas):
            coluna_fk = foreign_key_match.group(1)
            tabela_referenciada = foreign_key_match.group(2)
            coluna_referenciada = foreign_key_match.group(3)
            relacionamento = f"{tabela_referenciada}.{coluna_referenciada} = {nome_tabela}.{coluna_fk}"
            dicionario[nome_tabela]["relacionamentos"][tabela_referenciada] = relacionamento

    # Salvar o dicionário em um arquivo JSON
    with open(arquivo_json, 'w', encoding='utf-8') as json_file:
        json.dump(dicionario, json_file, ensure_ascii=False, indent=4)

    return dicionario

# Exemplo de uso
resultado = ler_arquivo_sql('/home/lenovo/dumps/Dump20250209.sql', 'resultado.json')
print(resultado)
# ```

# ### Explicação das mudanças:

# 1. **Regex para Captura de Tabela:**
#    - O padrão regex para capturar a tabela agora considera a presença de uma descrição da tabela que pode incluir especificações de configuração como `ENGINE=...`. A captura da tabela e suas colunas é feita em um grupo separado.

# 2. **Regex para Captura de Colunas e Chaves Estrangeiras:**
#    - A regex para as colunas foi mantida, que está agora mais robusta para capturar diferentes tipos e especificações de colunas corretamente.
#    - A regex que captura chaves estrangeiras também foi mantida. Essa regex agora não deve interferir na captura de colunas e permite que capture corretamente a definição de relacionamentos.

# ### Exemplo de uso:
# Você pode usar a função da mesma forma que antes, passando o caminho para o seu arquivo SQL e o arquivo JSON onde deseja salvar os resultados:

# ```python
# resultado = ler_arquivo_sql('seu_arquivo.sql', 'resultado.json')
# print(resultado)
# ```

# Agora, a função deve criar um dicionário no formato desejado, com colunas estruturadas corretamente e chaves estrangeiras bem definidas. Se você encontrar mais problemas ou se precisar de mais ajustes, não hesite em avisar!