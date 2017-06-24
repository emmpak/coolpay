class Login

  CREDENTIALS = { "username": ENV['USERNAME'], "apikey": ENV['API_KEY'] }
  CONTENT_TYPE = {'Content-Type': 'application/json'}

  attr_reader :client, :credentials

  def initialize(client:, credentials: CREDENTIALS)
    @client = client
    @credentials = credentials
  end

  def send_request(client, request_uri)
    http_request = set_post_request(body: credentials)
    client.http.request(http_request)
  end

  private
  def set_post_request(body:)
    request = Net::HTTP::Post.new(client.get_request_uri, CONTENT_TYPE)
    request.body = body.to_json
    request
  end
end
