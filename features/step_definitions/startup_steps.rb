require 'json'

Dado("o endereço da API para manter o cadastro de Startup") do
end

Quando("realizar uma requisição para cadastrar uma startup") do
  $response = @startup.postStartup
end

Então("a API irá retornar os dados do cadastro da Startup respondendo o código {int}") do |int|
  expect($response.code).to eq(201)
  puts "response code: #{$response.code}"
  expect($response.message).to eq("Created")
  puts "response message #{$response.message}" 

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
  puts "Code Get: #{$get.code}"
  expect($get.message).to eq("OK")
  puts "ID Get: #{$get["id"]}"
  puts "Message Get: #{$get.message}"
  expect($get["id"]).to eq($response["id"])
end

Dado("o endereço da API para cadastrar um Pagamento") do
end

Quando("realizar uma requisição passando o ID do Pedido") do
  $pagamentoCadastrado = @startup.postPagamento($get["id"])
end

Então("a API irá retornar os dados do pagamento correspondente respondendo o código {int}") do |statusCode|
  puts "Pagamento Code: #{$pagamentoCadastrado.code}"
  puts "Pagamento ID: #{$pagamentoCadastrado["id"]}"
  puts "Pagamento Mensagem: #{$pagamentoCadastrado.message}"
  expect($pagamentoCadastrado.message).to eq("Created")
  expect($pagamentoCadastrado.code).to eq(statusCode)


end

Dado("o endereço da API para consultar um Pagamento") do
end

Quando("realizar uma requisição passando o ID do Pagamento") do
  $getPagamento = @startup.getPagamento($pagamentoCadastrado["id"])
end

Então("a API irá retornar os dados do pagamento correspondente constando o código {int}") do |statusGetPagamento|
  puts "Pagamento ID: #{$getPagamento["ID"]}"
  expect($getPagamento.code).to eq(statusGetPagamento)
  puts "Pagamento GetMessage: #{$getPagamento.message}"
  puts "Pagamento code: #{$getPagamento.code}"
end

Quando("realizar uma requisição para cadastrar uma startup Sem Parametro") do
   $cadastroStartupSemParametro = @startup.postStartupSemParametroId
end

Então("a API irá retornar o erro {int}") do |int|
  puts "Cadastro sem parametro: #{$cadastroStartupSemParametro.code}"
  puts "Cadastro sem parametro: #{$cadastroStartupSemParametro.message}"
  puts "Customer : #{$cadastroStartupSemParametro["errors"]}"
  puts "Customer : #{$cadastroStartupSemParametro["errors"][0]["code"]}"

  resultado = "#{$cadastroStartupSemParametro.body.force_encoding("UTF-8").to_json}"
  
  # puts "Customer: #{$resultado["errors"]["code"]}"
end



