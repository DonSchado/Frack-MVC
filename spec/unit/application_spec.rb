require 'spec_helper'

FooController = Struct.new(:env) do
  def bar
    'baz'
  end
end

describe 'application' do
  let(:env) { { 'controller' => 'foo', 'action' => 'bar' } }
  subject { Frack::Application.call(env) }

  it "dispatches request to controller#action" do
    pending "Controller methods with string returning a no logger supported!"
    expect(subject.body).to eql(['baz'])
    expect(subject.status).to eql(200)
  end
end
