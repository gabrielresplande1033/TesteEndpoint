require "httparty"

response = HTTParty.post("http://5b49f9b0ff11b100149bf42b.mockapi.io/cm/startup",
                         :body => { "nome": "sympla", "cidade": "Belo Horizonte" })

puts "response code: #{response.code}"
puts "response message: #{response.message}"
puts "response headers: #{response.headers}"
puts "response body: #{response.body}"
