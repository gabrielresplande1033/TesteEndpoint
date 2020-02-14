Dado(/^o endereço da API para manter o cadastro de Startup$/) do
  #instanciado pela classe
end

Quando(/^realizar uma requisição para cadastrar uma startup$/) do
  $response = @startup.postStartup
end

Então(/^teste "([^"]*)"$/) do |string|
  puts "response code #{$response.code}"
  expect($response.code).to eql 201
  expect($response.message).to eql("Created")
  puts "Response Message: #{$response.message}"
  puts "Response Body: #{$response.body}"
end

Quando(/^realizar uma requisição passando o ID da startup$/) do
  $get = @startup.getStartup($id)
end

Então(/^a API irá retornar os dados da Startup correspondente respondendo o código "([^"]*)"$/) do |int|
  expect($get.code).to eq(int)
  expect($get.message).to eq("OK")
  expect($get["id"]).to eq($response["id"])

  puts "ID    : #{$get["id"]}"
  puts "Data  : #{$get["data"]}"
  puts "Nome  : #{$get["nome"]}"
  puts "Conta : #{$get["conta"]}"
  puts "Cidade: #{$get["cidade"]}"
  puts "Status Code: #{$get.code}"
end

#http://5b49f9b0ff11b100149bf42b.mockapi.io/api/v1/blogs/:
