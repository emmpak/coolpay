class PostRequest

  CONTENT_TYPE = {'Content-Type': 'application/json'}

  attr_reader :client, :credentials

  def initialize(client:, credentials:)
    @client = client
    @credentials = credentials
  end

  def send
    http_request = set(body: credentials)
    client.http.request(http_request)
  end

  def set(body:)
    request = Net::HTTP::Post.new(client.get_request_uri, CONTENT_TYPE)
    request.body = body.to_json
    request
  end
end
