class Startup
  include HTTParty
  require_relative "../hooks/startup_hook"
  base_uri "https://sandbox.moip.com.br/v2"

  def initialize(body, body2, body3)
    self.class.headers "Content-Type" => "application/json"
    self.class.headers "Authorization" => "Basic RkNaUkJFTTdIQ1BUVDZVUVE4WEhVOVhUM1k5QzhUQ0k6SEFMREdXVUJHWFVSQzdVODY1U0tZUjdMWlROSE1JUFpNRDdLTVlRQQ=="
    self.class.headers "username" => "FCZRBEM7HCPTT6UQQ8XHU9XT3Y9C8TCI"
    self.class.headers "password" => "HALDGWUBGXURC7U865SKYR7LZTNHMIPZMD7KMYQA"
    @options = { :body => body }
    @options3 = { :body => body2 }
    @options2 = { :body => body3}
  end

  def postStartup(pedido)
    self.class.post("/orders",body: pedido)
  end

  def getStartup(id)
    self.class.get("/orders/#{id}")
  end

  def postPagamento(id)
    self.class.post("/orders/#{id}/payments", @options3)
  end

  def getPagamento(id)
    self.class.get("/payments/#{id}")
  end

  def postStartupSemParametroId
    self.class.post("/orders", @options2)
  end

  # def putStartup(id)
  #   self.class.put("/orders/#{id}", @options)
  # end

  # def deleteStartup (id)
  #   self.class.delete("/orders/#{id}", @options2)
  # end
end
