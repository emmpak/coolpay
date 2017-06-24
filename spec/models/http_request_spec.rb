require './app/models/http_request'

describe HTTPRequest do
  let(:login_uri) { "/api/login" }
  let(:token) { 'you_are_cool'}
  let(:credentials) { {"username": "your_username", "apikey": "5up3r$ecretKey!"} }
  subject(:post) { described_class.new(type: 'POST', uri: login_uri) }
  subject(:get) { described_class.new(type: 'GET', uri: login_uri)}

  describe '#request' do
    context 'POST type' do
      it('returns a post request when the given type is POST') do
        expect(post.request).to be_kind_of(Net::HTTP::Post)
      end

      it('has a content-type header') do
        expect(post.request['content-type'.to_sym]).to eq 'application/json'
      end
    end

    context 'GET type' do
      it('returns a get request when the given type is GET') do
        expect(get.request).to be_kind_of(Net::HTTP::Get)
      end

      it('has a content-type header') do
        expect(get.request['content-type'.to_sym]).to eq 'application/json'
      end
    end
  end

  describe '#build' do
    context 'post request' do
      it('stores the given message in the body') do
        post.build(message: credentials)
        expect(post.get_body).to eq(credentials.to_json)
      end

      it('has an authorization header if token is provided') do
        post.build(token: token)
        expect(post.request['authorization']).to eq "Bearer #{token}"
      end

      it('does not have an authorization header if token is not provided') do
        post.build
        expect(post.request['authorization']).to eq nil
      end
    end

    context 'get request' do
      it('does not have a body') do
        get.build
        expect(get.get_body).to eq(nil)
      end
    end

    it('has an authorization header if token is provided') do
      get.build(token: token)
      expect(get.request['authorization']).to eq "Bearer #{token}"
    end

    it('does not have an authorization header if token is not provided') do
      get.build
      expect(get.request['authorization']).to eq nil
    end
  end
end
