require File.expand_path '../spec_helper.rb', __FILE__

describe 'App' do
  include Rack::Test::Methods

  def app
    App
  end

  describe '/' do
    it "says hello" do
      get '/'
      expect(last_response).to be_ok
      expect(last_response.body).to eq('Hello World')
    end
  end

  describe 'recent purchases by username' do
    before :each do
      @result = get "/api/recent_purchases/#{username}"
    end

    describe 'when user is found' do
      let(:username) { "zangief" }
      it 'returns list of recent purchases' do
        expect(@result.length).to be_a Array
      end

      it 'returns contains users who recently purchased the products' do
        expect(@result[0].recents).to be_a Array
      end
    end

    describe 'when user is not found' do
      let(:username) { "nonexistinguser" }
      it 'return correct message' do
        expect(@result).to eq("User with username of #{username} was not found")
      end
    end
  end
end
