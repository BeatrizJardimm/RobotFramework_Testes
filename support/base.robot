* Settings *
Documentation       Arquivo de base para o projeto
Library             RequestsLibrary
Library             OperatingSystem
Library             sfdsaf
Resource            ./common/common.robot
Resource            ./fixtures/dynamics.robot
Resource            ./variaveis/serverest_variaveis.robot


* Keywords *

Criar Sessao
    Create Session          serverest       ${BASE_URI}