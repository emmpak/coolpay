class HTTPRequest

  CONTENT_TYPE = {'Content-Type': 'application/json'}

  attr_reader :request

  def initialize(type:, uri:)
    @type = type
    @uri = uri
    @request = create
  end

  def build(token: nil, message: nil)
    set_authorization_header(token: token) if token != nil
    set_body(message: message) if post?
    request
  end

  def get_body
    request.body
  end

  private

  attr_reader :type, :uri

  def create
    post? ? create_post_request : create_get_request
  end

  def post?
    type == 'POST'
  end

  def create_post_request
    Net::HTTP::Post.new(uri, CONTENT_TYPE)
  end

  def create_get_request
    Net::HTTP::Get.new(uri, CONTENT_TYPE)
  end

  def set_authorization_header(token:)
    request['Authorization'] = "Bearer #{token}"
  end

  def set_body(message:)
    request.body = message.to_json
  end
end
