from tools.configuracao_logger import ConfiguracaoLogger
import mysql.connector

class DatabaseManager:
    """Gerenciador de banco de dados"""
    connection = None
    logger = ConfiguracaoLogger
    logger.configure_logger()

    def __init__(self, data):
        """
        Esta função realiza conexão com banco de dados.
        Parâmetros: data (object): { host (str), user (str), password (str), database (str) }
        Retorno: N/A
        """
        try:
            self.connection = mysql.connector.connect(
                host=data['host'],
                port=data['port'],
                user=data['user'],
                password=data['password'],
                database=data['database']
            )
        except mysql.connector.Error as err:
            self.logger.write_logger("error", f"Erro ao conectar no banco de dados: {err}")

    def run_mysql_query(self, query: str) -> str:
        """
        Esta função conecta-se a um banco de dados MySQL local e executa a query fornecida.
        Parâmetros: query (str): A query SQL que será executada no banco de dados.
        Retorno: str: O resultado da query em forma de string ou uma mensagem de erro, se houver.
        """
        self.logger.write_logger("info", f"Query: {query}")
        try:
            cursor = self.connection.cursor(dictionary=True)
            cursor.execute(query)
            result = cursor.fetchall()

            self.logger.write_logger("info", "Query executada com sucesso!")
            return str(result)
        except mysql.connector.Error as err:
            return f"Erro ao executar a query: {err}"
