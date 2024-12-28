import requests
from tools.global_variables import GlobalVariables

global_variables = GlobalVariables

class SmartServices:
    """
    Gerenciador de interações com a API Smart.
    """
    def __init__(self):
        self.auth()

    def request_base_smart(self, route, method, payload, headers):
        """
        Monta a requisição
        """
        url_base = "http://smart.local/api/"
        url = url_base + route
        print(url, payload, headers)
        match method:
            case 'GET':
                response = requests.get(url=url, headers=headers)
            case 'POST':
                response = requests.post(url=url, json=payload, headers=headers)
            case 'PUT':
                response = requests.put(url=url + f"/{payload['id']}", json=payload, headers=headers)
            case 'DELETE':
                response = requests.delete(url=url + f"/{payload['id']}", headers=headers)
        
        print(response)
        if response.status_code == 200:
            return response.json()
        else:
            return response
            

    def auth(self):
        """
        Logar no Smart
        """
        headers = {
            # "Authorization": f"Bearer {global_variables.user_token}",
            "Content-Type": "application/json"
        }
    
        payload = {
            "login": "cristiano.santana",
            "password": "29102018"
        }
        
        response = self.request_base_smart("auth", "POST", payload, headers)

        global_variables.user_token = response.get("token")
        
