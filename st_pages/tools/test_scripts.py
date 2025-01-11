from global_variables import GlobalVariables
from smart_controller import SmartController

global_variables = GlobalVariables
smart_controller = SmartController

response = """
    Vamos criar uma consulta SQL para isso:

    ```sql
    SELECT 
        YEAR(os.created_at) AS ano,
        MONTH(os.created_at) AS mes,
        ser.nome,
        COUNT(*) AS quantidade_vendida
    FROM 
        os
    JOIN 
        os_servicos AS oss ON (oss.os_id = os.id)
    JOIN 
        servicos AS ser ON (ser.id = oss.servico_id)
    WHERE 
        os.created_at >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
    GROUP BY 
        ano, mes, ser.nome
    ORDER BY 
        ano DESC, mes DESC, quantidade_vendida DESC;
    ```

    Essa consulta faz as seguintes coisas:

    - Seleciona o ano e mês da data de criação da ordem de serviço.
    - Selecione a descrição do serviço (nome) da ordem de serviço.
    - Conta a quantidade de vezes que cada serviço foi vendido no último ano.
    - Grupa os resultados por ano, mês e nome do serviço.
    - Ordem os resultados pelo ano em descendo, mês em descendo e quantidade vendida em descendo.

    Espero que isso ajude!
"""
smart_controller.handler(smart_controller, response)