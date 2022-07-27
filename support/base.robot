* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Library             Collections
Library             OperatingSystem
Library             ./common/python_library.py
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot


* Keywords *

Criar Sessao
    Create Session          serverest       ${BASE_URI}