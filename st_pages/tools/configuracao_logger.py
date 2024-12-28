import logging

class ConfiguracaoLogger:
    """
    Classe responsavel por configurar logs    
    """

    def configure_logger():
        """
        Configura o logger para exibir mensagens no console e gravá-las em arquivo.
        """

        logging.basicConfig(
            level=logging.INFO,
            format='%(asctime)s - %(levelname)s - %(message)s',
            datefmt='%Y-%m-%d %H:%M:%S',
            handlers=[
                logging.StreamHandler(),  # Log no console
                logging.FileHandler('aplicacao.log', encoding='utf-8')  # Log no arquivo
            ]
        )
    
    def write_logger(level, texto):
        match level:
            case 'info':
                logging.info(texto)
            case 'error':
                logging.error(texto)
            case 'warning':
                logging.warning(texto)
            case 'exception':
                logging.exception(texto)