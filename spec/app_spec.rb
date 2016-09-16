require 'spec_helper.rb'

describe 'App' do
  include Rack::Test::Methods

  describe 'recent purchases by username' do
    let(:user) { double("User") }
    let(:username) { "zangief" }
    let(:purchases) { [ { 'productId' => 999 } ] }
    let(:purchases_by_product) { [ { 'username' => 'zangief' }, { 'username' => 'rafa' } ] }
    let(:product) { { 'id' => 1, 'face' => 'my_face', 'price' => 232.2, 'size' => 34 } }

    before :each do
      allow(::Users).to receive(:user_by_username).and_return user
      allow(::Purchases).to receive(:recent_purchases_by_user).with(username).and_return purchases
      allow(::Purchases).to receive(:purchases_by_product).with(999).and_return purchases_by_product
      allow(::Products).to receive(:product_by_id).with(999).and_return product
      @result = get "/api/recent_purchases/#{username}"
    end

    describe 'when user is found' do
      it 'returns list of recent purchases' do
        expect(JSON.parse(@result.body)).to be_a Array
      end

      it 'has one item' do
        expect(JSON.parse(@result.body).length).to eq 1
      end

      it 'contains recent people who bougth same product' do
        expect(JSON.parse(@result.body)[0]['recent']).to be_a Array
      end
    end

    describe 'when user is not found' do
      let(:user) { nil }
      it 'return correct message' do
        expect(@result.body).to eq("User with username of '#{username}' was not found")
      end
    end
  end
end
