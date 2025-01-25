# Por que LLMs podem não seguir prompts longos?
* ### A capacidade de um modelo de linguagem grande (LLM) de seguir instruções em um prompt pode ser afetada por diversos fatores, especialmente quando o prompt se torna muito extenso.

## Principais motivos:
* ### Limitação de contexto: LLMs possuem uma janela de contexto, que é a quantidade de texto que eles podem processar de uma só vez. Prompts muito longos podem exceder essa janela, fazendo com que o modelo "esqueça" partes importantes das instruções iniciais.
* ### Ambiguidade: Prompts longos podem conter ambiguidades ou contradições, dificultando a compreensão do modelo sobre qual parte do prompt deve ser priorizada.
* ### Complexidade: Instruções muito complexas ou detalhadas podem sobrecarregar o modelo, levando a resultados imprevisíveis ou incompletos.
* ### Treinamento: A forma como o LLM foi treinado também influencia sua capacidade de lidar com prompts longos. Modelos treinados em dados mais complexos e variados geralmente são mais capazes de lidar com instruções longas e complexas.

## O que fazer para melhorar a resposta:
* ### Seja conciso e claro: Evite redundâncias e informações irrelevantes no prompt.
* ### Divida o prompt: Quebre o prompt em partes menores e mais específicas, fornecendo as instruções de forma gradual.
* ### Use marcadores: Utilize marcadores (como números ou letras) para organizar as instruções e facilitar a compreensão do modelo.
* ### Reforce as instruções mais importantes: Repita as instruções mais importantes no final do prompt para garantir que o modelo as tenha em mente.
* ### Experimente diferentes formulações: Mude a forma como você expressa as instruções para ver se isso melhora os resultados.
* ### Utilize técnicas de engenharia de prompts: Existem técnicas específicas para otimizar prompts, como a técnica de "few-shot learning", que consiste em fornecer ao modelo exemplos de entrada e saída desejada antes de apresentar a tarefa principal.

## Exemplo:
### Ao invés de:
* ### "Escreva um email formal para um cliente solicitando o pagamento de uma fatura vencida. Inclua os detalhes da fatura, a data de vencimento, os valores e as consequências do não pagamento. Seja educado e profissional, mas firme. Lembre-se de incluir uma assinatura com seu nome e cargo."

### Você poderia tentar:
* ### Prompt 1: "Escreva um email formal para um cliente solicitando o pagamento de uma fatura vencida."
* ### Prompt 2: "Inclua no email os seguintes detalhes: número da fatura, valor total, data de vencimento."
* ### Prompt 3: "Finalize o email com uma frase educada e profissional, lembrando as consequências do não pagamento."
* ### Prompt 4: "Assine o email com seu nome e cargo."

### Em resumo:
* ### Ao lidar com prompts longos, é importante encontrar um equilíbrio entre fornecer informações suficientes para o modelo e evitar sobrecarregá-lo. Experimentar diferentes abordagens e ajustar o prompt com base nos resultados obtidos é fundamental para obter os melhores resultados.