class PostRequest

  CONTENT_TYPE = {'Content-Type': 'application/json'}

  attr_reader :client, :body_message

  def initialize(client:, body_message:)
    @client = client
    @body_message = body_message
  end

  def send(token:nil)
    http_request = set(body: body_message, token: token)
    client.http.request(http_request)
  end

  def set(body:, token:)
    request = Net::HTTP::Post.new(client.get_request_uri, CONTENT_TYPE)
    request['Authorization'] = "Bearer #{token}" if token != nil
    request.body = body.to_json
    request
  end
end
