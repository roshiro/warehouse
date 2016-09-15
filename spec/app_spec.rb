require File.expand_path '../spec_helper.rb', __FILE__

describe 'App' do
  include Rack::Test::Methods

  def app
    App
  end

  describe 'recent purchases by username' do
    let(:user) { double("User") }
    let(:username) { "zangief" }

    before :each do
      allow(::Users).to receive(:user_by_username).and_return user
      @result = get "/api/recent_purchases/#{username}"
    end

    # describe 'when user is found' do
    #   it 'returns list of recent purchases' do
    #     expect(@result.length).to be_a Array
    #   end
    #
    #   it 'returns contains users who recently purchased the products' do
    #     expect(@result[0].recents).to be_a Array
    #   end
    # end

    describe 'when user is not found' do
      let(:user) { nil }
      it 'return correct message' do
        expect(@result).to eq("User with username of #{username} was not found")
      end
    end
  end
end
