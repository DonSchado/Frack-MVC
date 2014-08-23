require 'spec_helper'
require 'frack/base_controller'

class BarController < Frack::BaseController
  def foo
    redirect_to "/bar"
  end
end

describe 'base_controller' do
  context "redirect_to" do
    let(:env) { { 'controller' => 'bar', 'action' => 'foo' } }
    subject { Frack::Application.call(env) }

    it "response with status 301 and Location header" do
      expect(subject.status).to eql(301)
      expect(subject.body.join).to match(/Redirecting/)
      expect(subject.header).to have_key "Location"
      expect(subject.header["Location"]).to eql("/bar")
    end
  end
end
