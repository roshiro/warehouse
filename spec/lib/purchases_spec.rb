require 'spec_helper.rb'

describe 'Purchases' do
  include Rack::Test::Methods

  describe '.recent_purchases_by_user' do
    let(:purchases) { double("Purchases") }

    before :each do
      allow(RequestDispatcher).to receive(:get_and_cache).and_return({ 'purchases' => purchases })
    end

    it 'points to the correct URI' do
      expect(RequestDispatcher).to receive(:get_and_cache).with('/api/purchases/by_user/dummy_user?limit=5')
      Purchases.recent_purchases_by_user('dummy_user')
    end

    describe 'when purchases are found' do
      it 'returns the purchases' do
        expect(Purchases.recent_purchases_by_user('dummy_user')).to eq(purchases)
      end
    end

    describe 'when purchases are not found' do
      let(:purchases) { nil }
      it 'returns nil' do
        expect(Purchases.recent_purchases_by_user('dummy_user')).to eq(nil)
      end
    end
  end

  describe '.purchases_by_product' do
    let(:purchases) { double("Purchases") }

    before :each do
      allow(RequestDispatcher).to receive(:get_and_cache).and_return({ 'purchases' => purchases })
    end

    it 'points to the correct URI' do
      expect(RequestDispatcher).to receive(:get_and_cache).with('/api/purchases/by_product/dummy_user')
      Purchases.purchases_by_product('dummy_user')
    end

    describe 'when purchases are found' do
      it 'returns the purchases' do
        expect(Purchases.purchases_by_product('dummy_user')).to eq(purchases)
      end
    end

    describe 'when purchases are not found' do
      let(:purchases) { nil }
      it 'returns nil' do
        expect(Purchases.purchases_by_product('dummy_user')).to eq(nil)
      end
    end
  end
end
