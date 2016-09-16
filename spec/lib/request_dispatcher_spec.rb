require 'spec_helper.rb'

describe 'RequestDispatcher' do
  include Rack::Test::Methods

  it 'includes HTTParty module' do

  end

  it 'has correct base URI' do
    expect(RequestDispatcher.base_uri).to eq('http://74.50.59.155:6000')
  end

  describe '.get_and_cache' do
    before :each do
      allow(described_class).to receive(:get)
    end

    it 'caches the first call' do
      
    end

    it 'returns the cached version'
  end

  describe '.cache' do

  end
end
