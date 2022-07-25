import requests as req
import json

def Quantidade_Produtos():

    #realizando a requisição GET no endpoint /produtos
    r = req.get("http://localhost:3000/produtos")
    
    #lendo o arquivo json
    req_json = r.json()

    #retorna apenas o atributo quantidade
    return req_json["quantidade"]

def Nomes_Usuarios():
    r = req.get("http://localhost:3000/usuarios")
    usuarios = r.json()

    # loop que passa por todos os usuários e armazena o nome de cada um em uma lista
    lista = []
    for i in range(0, usuarios["quantidade"]):
        nome = usuarios["usuarios"][i]["nome"]
        lista.append(nome)
    
    #retorna uma lista com todos os usuários
    return lista

def Produtos_Fora_De_Carrinhos():
    req_produtos = req.get("http://localhost:3000/produtos")
    req_carrinhos = req.get("http://localhost:3000/carrinhos")
    produtos = req_produtos.json()
    carrinhos = req_carrinhos.json()

    # loop que passa por todos os produtos e armazenas suas respectivas ids e nomes em um dicionário 
    dict_nomes = {}
    for i in range(0, produtos["quantidade"]):
        ids = produtos["produtos"][i]["_id"]
        nome = produtos["produtos"][i]["nome"]
        dict_nomes[ids] = nome

    # WHILE LOOP se baseia na quantidade de carrinhos existentes para verificar os produtos dentro de cada carrinho
    # FOR LOOP procura pelas ids de produtos em um carrinho e verifica se essa id se encontra no dicionario criado anteriormente,
    # com base nessa verificação, se o produto com essa id estiver no dicionário, o elemento é retirado desse dicionário

    qnt_carrinhos = carrinhos["quantidade"]
    count = 0
    while count < qnt_carrinhos:
        for j in range(0, len(carrinhos["carrinhos"][count]["produtos"])):
            id_prod = carrinhos["carrinhos"][0]["produtos"][j]["idProduto"]

            if id_prod in dict_nomes:
                del dict_nomes[id_prod]
        count += 1
    
    # loop que passa pelos elementos do dicionário e armazena apenas os nomes em uma lista
    lista_nomes = []
    for i in dict_nomes:
        lista_nomes.append(dict_nomes[i])

    # retorna a lista com os nomes do s pordutos que naõ estão em nenhum carrinho
    return lista_nomes

def Usuario_Dono_Carrinho(id_carrinho):
    req_carrinhos = req.get("http://localhost:3000/carrinhos")
    req_usuarios = req.get("http://localhost:3000/usuarios")
    carrinhos = req_carrinhos.json()
    usuarios = req_usuarios.json()

    qnt_carrinhos = carrinhos["quantidade"]
    qnt_usuarios = usuarios["quantidade"]
    count = 0

    while count < qnt_carrinhos:
        if carrinhos["carrinhos"][count]["_id"] == id_carrinho:
            id_usuario = carrinhos["carrinhos"][count]["idUsuario"]
            count = 0
            break
        else:
            count += 1
    
    while count < qnt_usuarios:
        if usuarios["usuarios"][count]["_id"] == id_usuario:
            nome_usuario = usuarios["usuarios"][count]["nome"]
            return nome_usuario
        else:
            count += 1
    
    return "Usuário não encontrado"