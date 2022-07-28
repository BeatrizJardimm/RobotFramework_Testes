* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             ./common/python_library.py
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot
Resource            ../keywords/carrinhos_keywords.robot
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/usuarios_keywords.robot
Resource            ../keywords/login_keywords.robot


* Keywords *

Criar Sessao
    Create Session          serverest       ${BASE_URI}