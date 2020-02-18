Before "@startup" do
  @nome = Faker::Company.name

  body = {
    "ownId": @nome,
    "items": [
      {
        "product": "Box de Seriado - Exterminate!",
        "quantity": 1,
        "detail": "Box de seriado com 8 dvds",
        "price": 7300,
      },
    ],
    "customer": {
      "ownId": "cliente_xyz",
      "fullname": "João Silva",
      "email": "joaosilva@email.com",
    },
  }

  body3 = {
    "items": [
      {
        "product": "",
        "quantity": 1,
        "detail": "Box de seriado com 8 dvds",
        "price": 7300,
      },
    ],
    "customer": {
      "ownId": "cliente_xyz",
      "fullname": "João Silva",
      "email": "joaosilva@email.com",
    },
  }

  body2 = { 
    "installmentCount":2,
    "fundingInstrument":{ 
       "method":"CREDIT_CARD",
       "creditCard":{ 
          "expirationMonth":12,
          "expirationYear":25,
          "number":"5555666677778884",
          "cvc":"123",
          "holder":{ 
             "fullname":"João Portador da Silva",
             "birthdate":"1988-12-30",
             "taxDocument":{ 
                "type":"CPF",
                "number":"12345679891"
             },
             "phone":{ 
                "countryCode":"55",
                "areaCode":"11",
                "number":"66778899"
             }
          }
       }
    }
 }

  @body = body.to_json
  @body2 = body2.to_json
  @body3 = body3.to_json
  
  @startup = Startup.new(@body, @body2, @body3)
end
# @cidade = Faker::Address.city

# @nome = 'fewijfwi'

# Faker::Alphanumeric.alphanumeric(number: 10)

# @body = {
#     "nome": @nome,
#     "cidade": @cidade
# }

# @startup = Startup.new(@body)
