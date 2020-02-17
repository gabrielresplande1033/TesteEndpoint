class Startup
    include HTTParty
    require_relative '../hooks/startup_hook'
    base_uri "https://sandbox.moip.com.br/v2"

    @auth = {:username => "FCZRBEM7HCPTT6UQQ8XHU9XT3Y9C8TCI", password: "HALDGWUBGXURC7U865SKYR7LZTNHMIPZMD7KMYQA"}
     
    def initialize(body)
      self.class.headers "Content-Type"=>"application/json"
      self.class.headers "Authorization" => "Basic RkNaUkJFTTdIQ1BUVDZVUVE4WEhVOVhUM1k5QzhUQ0k6SEFMREdXVUJHWFVSQzdVODY1U0tZUjdMWlROSE1JUFpNRDdLTVlRQQ=="
      self.class.headers "username" => "FCZRBEM7HCPTT6UQQ8XHU9XT3Y9C8TCI"
      self.class.headers "password" => "HALDGWUBGXURC7U865SKYR7LZTNHMIPZMD7KMYQA"
      @options = {:body => body}
      @options2 = {}
    end
  
    def postStartup
      self.class.post("/orders",  @options)
    end

    def getStartup (id)
      self.class.get("/orders/#{id}", @options2)
    end

    # def putStartup (id)
    #   self.class.put("/orders/#{id}", @options)
    # end

    # def deleteStartup (id)
    #   self.class.delete("/orders/#{id}", @options2)
    # end
  end