require 'spec_helper'

describe 'routing middleware' do
  let(:app) { ->(env) { [200, env, ['ok']] } }
  let(:router) do
    Frack::Router.new app do
      match '/' => 'pages#index'
      match '/foo' => 'bar#baz'
    end
  end

  describe 'builder' do
    it 'builds all the routes' do
      expect(router.routes).to eq('/'=>'pages#index', '/foo'=>'bar#baz')
    end
  end

  context 'no route' do
    let(:request) { Rack::MockRequest.env_for('/somewhere') }

    it 'is 404' do
      status, header, response = router.call(request)

      expect(status).to eql(404)
      expect(header).to eql('Content-Length' => '9')
      expect(response.body).to eql(['Not found'])
    end
  end

  context 'matching index route' do
    let(:request) { Rack::MockRequest.env_for('/') }

    it 'calls the app' do
      expect(app).to receive(:call)
      router.call(request)
    end

    it 'merges the mapping' do
      header = router.call(request)[1]
      expect(header['controller']).to eql('pages')
      expect(header['action']).to eql('index')
    end
  end

  context 'default route for empty router' do
    let(:empty_router) { Frack::Router.new(app) }
    let(:request) { Rack::MockRequest.env_for('/') }

    it 'is just 404' do
      status, header, response = empty_router.call(request)
      expect(status).to eql(404)
      expect(response.body).to eql(['Not found'])
    end
  end
end
