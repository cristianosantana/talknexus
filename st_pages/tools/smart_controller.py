from tools.global_variables import GlobalVariables
from tools.smart_services import SmartServices
from tools.configuracao_logger import ConfiguracaoLogger
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

    def handler(self, response_ia):
            """
            Realiza a requisição
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

    def verify_params_entity(entity, params):
        """
        Verifica se todos paramentros obrigatorios da tabela estão presentes
        """
