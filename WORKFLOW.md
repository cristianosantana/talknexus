# FLUXO DE TRABALHO DOS AGENTES

## RESUMO: 
* ### Teremos inicialmente um time de 5 agentes!
    #### 1. **Criador de Consultas:** Especialista em banco de dados relacional experiente em traduzir solicitações em linguagem natural para consultas SQL precisas. Basicamente este recebi a pergunta do usuário e extrai um query dela, para executar a função *Executar Consultas*.
    #### 2. **Função: Executar Consultas:** Este é uma função especialista que conecta a um banco de dados, executa queries (contultas) e retorna o resultado num formato universal JSON.
    #### 3. **Analista de Dados:** Especialista em analisar dados e extrair valor desses dados! Basicamente este recebi a pergunta do usuário e os dados retornados da função *Executar Consultas* então responde a pergunta do usuário! 
    #### 4. **Revisor de Analises de Dados:** Especialista em revisar analises de dados realisadas por analistas experientes, com o objetivo de qualificar essas analises, de forma que se a anilise for ruim, esta será devolvida ao analista, para melhora-la, caso contrario entregará a analise ao escritor. 
    #### 5. **Escritor de Relatorios:** Especialista em tornar analises complexas, faceis de serem lidas por usuários leigos.