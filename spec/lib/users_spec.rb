require 'spec_helper.rb'

describe 'Users' do
  include Rack::Test::Methods

  describe '.user_by_username' do
    let(:user) { double("User") }

    before :each do
      allow(RequestDispatcher).to receive(:get_and_cache).and_return({ 'user' => user })
    end

    it 'points to the correct URI' do
      expect(RequestDispatcher).to receive(:get_and_cache).with('/api/users/dummy_user')
      Users.user_by_username('dummy_user')
    end

    describe 'when user is found' do
      it 'returns the product JSON' do
        expect(Users.user_by_username('dummy_user')).to eq(user)
      end
    end

    describe 'when user is not found' do
      let(:user) { nil }
      it 'returns nil' do
        expect(Users.user_by_username('dummy_user')).to eq(nil)
      end
    end
  end
end
