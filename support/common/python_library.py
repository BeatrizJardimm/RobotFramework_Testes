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

def Usuarios_Sem_Carrinhos():
    req_usuarios = req.get("http://localhost:3000/usuarios")
    req_carrinhos = req.get("http://localhost:3000/carrinhos")
    usuarios = req_usuarios.json()
    carrinhos = req_carrinhos.json()

    # loop que passa por todos os usuarios e armazena suas respectivas ids e nomes em um dicionário 
    dict_nomes = {}
    for i in range(0, usuarios["quantidade"]):
        ids = usuarios["usuarios"][i]["_id"]
        nome = usuarios["usuarios"][i]["nome"]
        dict_nomes[ids] = nome

    # WHILE LOOP se baseia na quantidade de carrinhos existentes para verificar a id do usuário dono de cada carrinho
    # verifica se a id de usuário encontrada no carrinho também aparece no dicionario criado anteriormente,
    # com base nessa verificação, se o usuario com essa id estiver no dicionário,
    # o elemento correspondente a id e nome desse user é retirado do dicionário

    qnt_carrinhos = carrinhos["quantidade"]
    count = 0
    while count < qnt_carrinhos:
        id_user = carrinhos["carrinhos"][count]["idUsuario"]

        if id_user in dict_nomes:
            del dict_nomes[id_user]
        count += 1
    
    # loop que passa pelos elementos do dicionário e armazena apenas os nomes em uma lista
    lista_nomes = []
    for i in dict_nomes:
        lista_nomes.append(dict_nomes[i])

    # retorna a lista com os nomes dos usuários que não possuem carrinho
    return lista_nomes

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
            id_prod = carrinhos["carrinhos"][count]["produtos"][j]["idProduto"]

            if id_prod in dict_nomes:
                del dict_nomes[id_prod]
        count += 1
    
    # loop que passa pelos elementos do dicionário e armazena apenas os nomes em uma lista
    lista_nomes = []
    for i in dict_nomes:
        lista_nomes.append(dict_nomes[i])

    # retorna a lista com os nomes dos produtos que não estão em nenhum carrinho
    return lista_nomes

def Usuario_Dono_Carrinho(id_carrinho):
    req_carrinhos = req.get("http://localhost:3000/carrinhos")
    req_usuarios = req.get("http://localhost:3000/usuarios")
    carrinhos = req_carrinhos.json()
    usuarios = req_usuarios.json()

    qnt_carrinhos = carrinhos["quantidade"]
    qnt_usuarios = usuarios["quantidade"]
    
    # WHILE loop que passa por todos os carrinhos cadastrados comparando a id de cada um com o valor de entrada
    # caso as ids forem as mesmas, cria-se uma variavel que armazena a id do usuário dono desse carrinho,
    # se a id não for a mesma, passamos para o próximo carrinho

    count = 0
    while count < qnt_carrinhos:
        if carrinhos["carrinhos"][count]["_id"] == id_carrinho:
            id_usuario = carrinhos["carrinhos"][count]["idUsuario"]
            count = 0
            break
        else:
            count += 1
    

    # WHILE loop onde passamos por todos os usuários cadastrados
    # procurando pelo user cuja id corresponde à da variável que criamos no loop acima
    # caso as ids coincidam, retornamos o nome do usuário, se não passamos para o próximo user

    while count < qnt_usuarios:
        if usuarios["usuarios"][count]["_id"] == id_usuario:
            nome_usuario = usuarios["usuarios"][count]["nome"]
            return nome_usuario
        else:
            count += 1
    
    #caso o usuário dono do carrinho não seja encontrado, esse é o retorno default:
    return "Usuário não encontrado"

def Valida_Preco_Total(id_carrinho):
    req_produtos = req.get("http://localhost:3000/produtos")
    req_carrinhos = req.get("http://localhost:3000/carrinhos")
    produtos = req_produtos.json()
    carrinhos = req_carrinhos.json()

    qnt_carrinhos = carrinhos["quantidade"]
    qnt_produtos = produtos["quantidade"]

    lista_ids_produtos = []
    lista_qnt_produtos = []

    count = 0
    while count < qnt_carrinhos:
        if carrinhos["carrinhos"][count]["_id"] == id_carrinho:
            for j in range(0, len(carrinhos["carrinhos"][count]["produtos"])):
                total_carrinho = carrinhos["carrinhos"][count]["precoTotal"]
                qnt_prod = carrinhos["carrinhos"][count]["produtos"][j]["quantidade"]
                id_prod = carrinhos["carrinhos"][count]["produtos"][j]["idProduto"]
                lista_ids_produtos.append(id_prod)
                lista_qnt_produtos.append(qnt_prod)
            count = 0
            break
        else:
            count += 1

    lista_precos_por_produto = []
    while count < qnt_produtos:
        if produtos["produtos"][count]["_id"] in lista_ids_produtos:
            preco_produto = produtos["produtos"][count]["preco"]
            
            preco_produto_carrinho = lista_qnt_produtos[count] * preco_produto
            lista_precos_por_produto.append(preco_produto_carrinho)
            count += 1

    soma_total_precos = sum(lista_precos_por_produto)

    if soma_total_precos == total_carrinho:
        
        return "O preço total foi validado e está correto."
    else:
        return "O preço total mostrado pela API não está correto."