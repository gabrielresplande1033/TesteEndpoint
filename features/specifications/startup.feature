#language: pt
@startup
Funcionalidade: Manter dados de Startup através da API
    Como um usuário do sistema
    Eu quero realizar as requisições na API
    Afim de manipular as informações do cadastro de startup

# Cenário: Cadastrar uma Startup
#     Dado o endereço da API para manter o cadastro de Startup
#     Quando realizar uma requisição para cadastrar uma startup
#     Então a API irá retornar os dados do cadastro da Startup respondendo o código 201

# Cenário: Consultar uma Startup
#     Dado o endereço da API para manter o cadastro de Startup
#     Quando realizar uma requisição passando o ID da startup
#     Então a API irá retornar os dados da Startup correspondente respondendo o código 200
    

# Cenário: Cadastrar um Pagamento
#     Dado o endereço da API para cadastrar um Pagamento
#     Quando realizar uma requisição passando o ID do Pedido
#     Então a API irá retornar os dados do pagamento correspondente respondendo o código 201

# Cenário: Consultar um Pagamento
#     Dado o endereço da API para consultar um Pagamento
#     Quando realizar uma requisição passando o ID do Pagamento
#     Então a API irá retornar os dados do pagamento correspondente constando o código 200

# Cenário: Cadastrar uma StartupSemParametro
#     Dado o endereço da API para manter o cadastro de Startup
#     Quando realizar uma requisição para cadastrar uma startup Sem Parametro
#     Então a API irá retornar o erro 500

@esquema
Esquema do Cenário: valida pedido
    Dado que tenho o pedido <codigo>
    Quando realizar uma requisição para cadastrar uma startup
    Então a API irá retornar a mensagem <msg>

    Exemplos:
        | codigo      | msg        |
        | "semTitulo" | "Created"  |
        # | "semStatus" | "mensagem para sem titulo"