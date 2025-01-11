from tools.global_variables import GlobalVariables
from tools.smart_services import SmartServices
from tools.configuracao_logger import ConfiguracaoLogger
from tools.database_manager import DatabaseManager
import streamlit as st
import json 

class SmartController:
    """
    Responsavel por preparar dados, selecionar/executar rota a SMART_API
    """
    global_variables = GlobalVariables
    smart_services = SmartServices()
    logger = ConfiguracaoLogger
    logger.configure_logger()
    connection_db = DatabaseManager({'host': "127.0.0.1", 'port': "3306", 'user': "root", 'password': "secret", 'database': "smart"})

    def handler(self, response_ia):
        """
        Porta de entrada dessa classe: extrai um objeto de uma string e chama funções para acesso a api_rest ou banco de dados.
        Parâmentros: response_ia (string): contém um objeto gerado pelo modelo de linguagem.
        Retorno: True ou False que indica sucesso ou fracasso.
        """
        usar_api_rest = False

        if usar_api_rest:
            self.request_handler(self, response_ia)
        else: 
            self.database_access_handler(self, response_ia)
    
    def database_access_handler(self, response_ia):
        """
        Conecta a um banco de dados, executa consultas e retorna resultados.
        Parâmetros: query (string): consulta em MySql.
        Retorno: Resultado da consulta.
        """

        self.logger.write_logger("info", "Executar search_for_query_in_string()")
        query = self.search_for_query_in_string(self, response_ia)
        self.logger.write_logger("info", "Executar run_mysql_query()")
        self.run_mysql_query(self, query)

    def run_mysql_query(self, query):
        """Conecta e executa queries"""
        self.global_variables.response = self.connection_db.run_mysql_query(query)
        
    def request_handler(self, response_ia):
            """
            Executa rota a API_REST.
            Parâmetros: response (object): contém rota e dados a serem usado para chamar a rotas.
            Retorno: Resultado da API_REST.
            """
            try:
                self.global_variables.object_found = self.search_for_object_in_string(self, response_ia)
                if self.global_variables.object_found != None and "erro" not in self.global_variables.object_found:
                    result = self.__format_data(self, self.global_variables.entities_columns_required, self.global_variables.object_found)
                    result1 = self.__select_route(self, result)

                    self.global_variables.response = self.request_api_smart(self, result1.get("route"), result1.get("method"), result1.get("parameters"))
            except ValueError as e:
                self.logger.write_logger("error", f"Erro ao processar solicitação! Error: {e}, dados: {self.global_variables.object_found}")
                st.error(f"Erro ao processar solicitação! Error: {e}, dados: {self.global_variables.object_found}")

    def __select_route(self, data):
        """
        Seleciona rota
        """
        for el in data.get("routes"):
            if data.get("action") == el:
                match data.get("action"):
                    case 'buscar':
                        data['method'] = 'GET'
                    case 'criar':
                        data['method'] = 'POST'
                    case 'atualizar':
                        data['method'] = 'PUT'
                    case 'apagar':
                        data['method'] = 'DELETE'
                data['route'] = data.get("routes")[el]
        self.logger.write_logger("info", f"Rota: {data['route']} selecionada!")
        st.info(f"Rota: {data['route']} selecionada!")
        return data

    def __format_data(self, entities_columns_required, data):
        """
        Prepara dados para chamar rota
        """
        result = {}
        for value in entities_columns_required:
            if value.get("entity") == data.get("entidade"): # verifica entidades
                value["action"] = data.get("acao") # atribui ação
                if value["action"] in ['criar', 'atualizar', 'delete']:
                    for el in value.get("parameters"):
                        # verifica se atributo foi passado e atribui ao paramentros
                        if el in data.get("dados"):
                            value.get("parameters")[el] = data.get("dados")[el]
                            result = value # salva o objeto pronto para requisição
                        else: 
                            self.logger.write_logger("error", f"Parametro {value} não encontrado!")
                            st.error(f"Parametro {value} não encontrado!")
                elif(value["action"] == 'buscar'):
                    result = value
                else:
                    self.logger.write_logger("error", f"Action: {value["action"]} não encontrada!")
                    st.error(f"Action: {value["action"]} não encontrada!")
                self.logger.write_logger("info", f"Dados preparados! Result: {result}")
                return result
            else: 
                self.logger.write_logger("error", f"Entidade: {data.get("entidade")} não encontrada!")
                st.error(f"Entidade: {data.get("entidade")} não encontrada!")

    def request_api_smart(self, route, method, data):
        """
        Realisa a requisição ao backend
        """
        headers = {
            "Authorization": f"Bearer {self.global_variables.user_token}",
            "Content-Type": "application/json"
        }
        show_message = 1
        self.logger.write_logger("info", f"Dados da requisição route: {route}, method: {method}, data: {data}")
        st.info(f"Dados da requisição route: {route}, method: {method}")
    
        return self.smart_services.request_base_smart(route, method, data, headers, show_message)

    def search_for_object_in_string(self, response):
        """
        Extrai o objeto da string
        """
        try:  
            start = response.find('{')
            end = response.rfind('}')
            if start != -1 and end != -1:
                string = response[start:end+1]
                self.logger.write_logger("info", f"String a ser convertido em dicionário: {string}")
                dictionary = json.loads(string)
                self.logger.write_logger("info", f"Objeto convertido para dicionário: {dictionary}")
                return dictionary
            else:
                self.logger.write_logger("warning", f"Nenhum objeto encontrado na resposta do modelo! RESPOSTA: {response}")        
                st.warning(f"Nenhum objeto encontrado na resposta do modelo! RESPOSTA: {response}")
        except json.JSONDecodeError as e:
            self.logger.write_logger("exception", f"Erro ao decodificar o JSON. Error: {e}.")
            st.warning(f"Erro ao decodificar o JSON. Error: {e}.")
    
    def search_for_query_in_string(self, response):
        """
        Extrai query da resposta do llm
        """
        try:  
            self.logger.write_logger("info", f"String que contem a query: {response}")
            start = response.find('sql')
            end = response.rfind('```')
            if start != -1 and end != -1:
                query = response[start+3:end]
                self.logger.write_logger("info", f"Query extraida da resposta: {query.strip()}")
                return query.strip()
            else:
                self.logger.write_logger("warning", f"Erro ao estrai query da resposta do modelo! RESPOSTA: {response}")        
                st.warning(f"Erro ao estrai query da resposta do modelo! RESPOSTA: {response}")
        except json.JSONDecodeError as e:
            self.logger.write_logger("exception", f"Erro ao estrai query da resposta do modelo. Error: {e}.")
            st.warning(f"Erro ao estrai query da resposta do modelo. Error: {e}.")

    def verify_params_entity(entity, params):
        """
        Verifica se todos paramentros obrigatorios da tabela estão presentes
        """
