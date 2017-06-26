require_relative 'http_request'
require_relative 'http_client'

class CoolpayAPI

  attr_reader :http_client_class, :http_request_class

  def initialize(http_client_class: HTTPClient, http_request_class: HTTPRequest)
    @http_client_class = http_client_class
    @http_request_class = http_request_class
  end

  def send_request(path:, type:, message:nil, token:nil)
    client = http_client_class.new(path: path)
    request = http_request_class.new(type: type, uri: client.get_request_uri)
    client.http.request(request.build(message: message, token: token))
  end
end
