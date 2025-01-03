from tools.global_variables import GlobalVariables
from tools.configuracao_logger import ConfiguracaoLogger
import requests
import streamlit as st

global_variables = GlobalVariables

class SmartServices:
    """
    Gerenciador de interações com a API Smart.
    """
    logger = ConfiguracaoLogger
    logger.configure_logger()

    def __init__(self):
        self.auth()

    def request_base_smart(self, route, method, payload, headers,  show_message = 1):
        """
        Monta a requisição
        """
        url_base = "http://smart.local/api/"
        url = url_base + route
        
        match method:
            case 'GET':
                response = requests.get(url=url, headers=headers)
            case 'POST':
                response = requests.post(url=url, json=payload, headers=headers)
            case 'PUT':
                response = requests.put(url=url + f"/{payload['id']}", json=payload, headers=headers)
                if response.status_code == 404:
                    response = requests.post(url=url, json=payload, headers=headers)
            case 'DELETE':
                response = requests.delete(url=url + f"/{payload['id']}", headers=headers)
        
        if response.status_code >= 200 and response.status_code <= 299:
            self.logger.write_logger("info", f"response success API SMART, url: {url}")
            if show_message:
                st.info(f"response success API SMART, url: {url}")
            return response.json()
        else:
            self.logger.write_logger("warning", f"response error API SMART: {response}")
            if show_message:
                st.warning(f"response error API SMART: {response}")
            return response

    def auth(self):
        """
        Logar no Smart
        """
        headers = {
            "Content-Type": "application/json"
        }
    
        payload = {
            "login": "cristiano.santana",
            "password": "29102018"
        }
        show_message = 0
        response = self.request_base_smart("auth", "POST", payload, headers, show_message)

        global_variables.user_token = response.get("token")
