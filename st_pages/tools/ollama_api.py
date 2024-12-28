import streamlit as st
import requests

class OllamaAPI:
    """
    Gerenciador de interações com a API Ollama.
    """
    def get_ollama_models() -> list:
        """
        Retrieves available models from Ollama API.
        
        Sends GET request to Ollama API endpoint and processes response to extract
        valid model names, filtering out failed or invalid models.
        
        Returns:
            list: List of available model names, empty if API unreachable
        """

        try:
            response = requests.get("http://localhost:11434/api/tags")
            if response.status_code == 200:
                models = response.json()
                return [model['name'] for model in models['models']
                        if all(keyword not in model['name'].lower()
                            for keyword in ('failed', 'embed', 'bge'))]
            return []
        except:
            return []
    
    def on_model_change():
        """
        Callback function triggered when selected model changes.
        
        Resets conversation state by clearing message history and conversation chain
        to start fresh with new model.
        """
        st.session_state.messages = []
        st.session_state.conversation = None
