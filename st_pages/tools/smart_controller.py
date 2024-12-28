from tools.global_variables import GlobalVariables
from tools.smart_services import SmartServices

class SmartController:
    """
    Prepara dados e seleciona rota a ser chamada
    """
    global_variables = GlobalVariables
    smart_services = SmartServices()

    def __select_route(self, data):
        """
        Seleciona rota
        """
        for el in data.get("routes"):
            if data.get("action") == el:
                match data.get("action"):
                    case 'criar':
                        data['method'] = 'POST'
                    case 'atualizar':
                        data['method'] = 'PUT'
                    case 'apagar':
                        data['method'] = 'DELETE'
                data['route'] = data.get("routes")[el]

        return data

    def __format_data(self, entities_columns_required, data):
        """
        Prepara dados para chamar rota
        """
        result = {}
        for value in entities_columns_required:
            if value.get("entity") == data.get("entidade"): 
                value["action"] = data.get("acao")
                for el in value.get("parameters"):
                    value.get("parameters")[el] = data.get("dados")[el]
                    result = value
        
        return result

    def request_api_smart(self, route, method, data):
        """
        Realisa a requisição ao backend
        """
        headers = {
            "Authorization": f"Bearer {self.global_variables.user_token}",
            "Content-Type": "application/json"
        }
        if method == 'PUT':
            self.smart_services.request_base_smart(route, method, data, headers)
            self.smart_services.request_base_smart(route, 'POST', data, headers)
        else:    
            self.smart_services.request_base_smart(route, method, data, headers)

    def verify_params_entity(entity, params):
        """
        Verifica se todos paramentros obrigatorios da tabela estão presentes
        """

    def handler(self, data):
        """
        Realiza a requisição
        """
        print(data)
        result = self.__format_data(self, self.global_variables.entities_columns_required, data)
        print(result)
        result1 = self.__select_route(self, result)

        self.request_api_smart(self, result1.get("route"), result1.get("method"), result1.get("parameters"))

