require 'spec_helper.rb'

describe 'RequestDispatcher' do
  include Rack::Test::Methods

  let(:response) { double("Response") }
  let(:path) { "path" }
  before :each do
    allow(RequestDispatcher).to receive(:get)
    allow(RequestDispatcher).to receive(:get).and_return response
    RequestDispatcher.class_variable_set :@@cache, nil
  end

  it 'has correct base URI' do
    expect(RequestDispatcher.base_uri).to eq('http://74.50.59.155:6000')
  end

  describe '.get_and_cache' do
    it 'caches the first call' do
      RequestDispatcher.get_and_cache(path)
      expect(RequestDispatcher.cache).to eq({ path => response })
    end

    it 'returns the cached version' do
      RequestDispatcher.cache[path] = "some_other_content"
      expect(RequestDispatcher.get_and_cache(path)).to eq("some_other_content" )
    end
  end

  describe '.cache' do
    it 'caches the response of the request with correct key' do
      RequestDispatcher.get_and_cache(path)
      expect(RequestDispatcher.cache).to eq({"path"=>"some_other_content"})
    end
  end
end
