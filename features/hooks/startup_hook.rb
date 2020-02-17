Before '@startup' do
    @nome = Faker::Company.name

    body = {
        "ownId": @nome,
        "items": [
          {
            "product": "Box de Seriado - Exterminate!",
            "quantity": 1,
            "detail": "Box de seriado com 8 dvds",
            "price": 7300
          }
        ],
        "customer": {
          "ownId": "cliente_xyz",
          "fullname": "João Silva",
          "email": "joaosilva@email.com"
        }
      }

      @body = JSON.generate(body);

      @startup = Startup.new(@body);

end
    # @cidade = Faker::Address.city

    # @nome = 'fewijfwi'
    
    # Faker::Alphanumeric.alphanumeric(number: 10)

    # @body = {
    #     "nome": @nome,
    #     "cidade": @cidade
    # }

    # @startup = Startup.new(@body)
    
