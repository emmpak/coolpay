class CoolpayRequest
    attr_reader :uri, :http

    CONTENT_TYPE = {'Content-Type': 'application/json'}

    def initialize(uri:)
      @uri = URI.parse(uri)
      @http = set_http_connection
    end

    def set_post_request(body:)
      request = Net::HTTP::Post.new(uri.request_uri, CONTENT_TYPE)
      request.body = body.to_json
      request
    end

    private
    def set_http_connection
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http
    end
  end
