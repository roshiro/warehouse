require 'spec_helper.rb'

describe 'Products' do
  include Rack::Test::Methods

  describe '.product_by_id' do
    let(:product) { double("Product") }

    before :each do
      allow(RequestDispatcher).to receive(:get_and_cache).and_return({ 'product' => product })
    end

    it 'points to the correct URI' do
      expect(RequestDispatcher).to receive(:get_and_cache).with('/api/products/333444')
      Products.product_by_id(333444)
    end

    describe 'when product is found' do
      it 'returns the product JSON' do
        expect(Products.product_by_id(333444)).to eq(product)
      end
    end

    describe 'when product is not found' do
      let(:product) { nil }
      it 'returns nil' do
        expect(Products.product_by_id(333444)).to eq(nil)
      end
    end
  end

end
