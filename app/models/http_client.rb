class HTTPClient
    attr_reader :uri, :http

    def initialize(path:)
      @uri = URI.parse("https://coolpay.herokuapp.com/api/#{path}")
      @http = set_http_connection
    end

    def get_request_uri
      uri.request_uri
    end

    private
    def set_http_connection
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http
    end
  end
