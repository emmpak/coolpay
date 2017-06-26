require_relative 'http_request'
require_relative 'http_client'

class CoolpayAPI

  attr_reader :http_client_class, :http_request_class

  def initialize(http_client_class: HTTPClient, http_request_class: HTTPRequest)
    @http_client_class = http_client_class
    @http_request_class = http_request_class
  end

  def login(credentials)
    client = http_client_class.new(path: 'login')
    request = http_request_class.new(type: 'POST', uri: client.get_request_uri)
    client.http.request(request.build(message: credentials))
  end
end
