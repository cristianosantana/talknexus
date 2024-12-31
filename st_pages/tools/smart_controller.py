from tools.global_variables import GlobalVariables
from tools.smart_services import SmartServices
from tools.configuracao_logger import ConfiguracaoLogger

class SmartController:
    """
    Prepara dados e seleciona rota a ser chamada
    """
    global_variables = GlobalVariables
    smart_services = SmartServices()
    logger = ConfiguracaoLogger
    logger.configure_logger()
    
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
        self.logger.write_logger("info", "Seleciona rota")
        return data

    def __format_data(self, entities_columns_required, data):
        """
        Prepara dados para chamar rota
        """
        result = {}
        for value in entities_columns_required:
            if value.get("entity") == data.get("entidade"): # verifica entidades
                value["action"] = data.get("acao") # atribui ação
                if data.get("acao") != 'buscar':
                    for el in value.get("parameters"):
                        # verifica se atributo foi passado e atribui ao paramentros
                        if el in data.get("dados"):
                            value.get("parameters")[el] = data.get("dados")[el]
                            result = value # salva o objeto pronto para requisição
                        else: 
                            raise ValueError("Nenhum parametro encontrado!")
                else:
                    result = value        
                self.logger.write_logger("info", "Prepara dados")
                return result
            else: 
                raise ValueError("Nenhuma entidade encontrada!")

    def request_api_smart(self, route, method, data):
        """
        Realisa a requisição ao backend
        """
        headers = {
            "Authorization": f"Bearer {self.global_variables.user_token}",
            "Content-Type": "application/json"
        }
        self.logger.write_logger("info", f"Realisa a requisição route: {route}, method: {method}, data: {data}, headers: {headers}")
        return self.smart_services.request_base_smart(route, method, data, headers)

    def verify_params_entity(entity, params):
        """
        Verifica se todos paramentros obrigatorios da tabela estão presentes
        """

    def handler(self, data):
        """
        Realiza a requisição
        """
        try:
            result = self.__format_data(self, self.global_variables.entities_columns_required, data)
            result1 = self.__select_route(self, result)

            self.global_variables.response = self.request_api_smart(self, result1.get("route"), result1.get("method"), result1.get("parameters"))
        except ValueError as e: 
            self.logger.write_logger("error", f"Erro ao processar solicitação: {e}")

