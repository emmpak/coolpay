class CoolpayRequest
    attr_reader :uri

    def initialize(uri)
      @uri = URI.parse(uri)
      @header = {'Content-Type': 'application/json'}

    end
  end


  #
  # uri = URI.parse("https://coolpay.herokuapp.com/api/login")
  # header = {'Content-Type': 'application/json'}
  # credentials = {
  #     "username": 
  #     "apikey":
  # }
  # http = Net::HTTP.new(uri.host, uri.port)
  # http.use_ssl = true
  # request = Net::HTTP::Post.new(uri.request_uri, header)
  # request.body = credentials.to_json
  # response = http.request(request)
