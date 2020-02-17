

Dado("o endereço da API para manter o cadastro de Startup") do
end
  
  Quando("realizar uma requisição para cadastrar uma startup") do
    $response = @startup.postStartup
  end
  
  Então("a API irá retornar os dados do cadastro da Startup respondendo o código {int}") do |int|
    expect($response.code).to eq(201)
    puts "response code: #{$response.code}"
    expect($response.message).to eq("Created")
    puts "response message #{$response.message}"#{}

    puts "ID Response : #{$response["id"]}"
    puts "OwnID : #{$response["ownId"]}"
    puts "Items : #{$response["items"]}"
    puts "Customer : #{$response["customer"]["fullname"]}"


  end
        
Quando("realizar uma requisição passando o ID da startup") do
    $get = @startup.getStartup($response["id"])
end

Então("a API irá retornar os dados da Startup correspondente respondendo o código {int}") do |int|
    expect($get.code).to eq(int)
    expect($get.message).to eq("OK")
    puts "ID Get: #{$get["id"]}"
    puts "Message Get: #{$get.message}"
    expect($get["id"]).to eq($response["id"])
    
end

# Quando("realizar uma requisição para alterar uma startup") do
#     $put = @startup.putStartup($get["id"])
# end

# Então("a API irá retornar os dados da Startup alterados respondendo o código {int}") do |int|
#     expect($put.code).to eq(int)
#     expect($put.message).to eq("OK")
#     expect($put["id"]).to eq($response["id"])

#     puts "ID    : #{$put["id"]}"
#     puts "Data  : #{$put["data"]}"
#     puts "Nome  : #{$put["nome"]}"
#     puts "Conta : #{$put["conta"]}"
#     puts "Cidade: #{$put["cidade"]}"
#     puts "Status Code: #{$put.code}"
# end

# Quando("realizar uma requisição para excluir uma startup") do
#   $delete = @startup.deleteStartup($put["id"])
# end

# Então("a API deverá retornar os dados da exclusão respondendo o código {int}") do |int|
#     expect($delete.code).to eq(int)
#     expect($delete.message).to eq("OK")


#     puts "ID    : #{$delete["id"]}"
#     puts "Data  : #{$delete["data"]}"
#     puts "Nome  : #{$delete["nome"]}"
#     puts "Conta : #{$delete["conta"]}"
#     puts "Cidade: #{$delete["cidade"]}"
#     puts "Status Code: #{$delete.code}"
# end
