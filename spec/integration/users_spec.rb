require 'spec_helper'

Capybara.app = Rack::Builder.new do
  eval(File.read(File.expand_path('./config.ru')))
end

describe 'users#index' do
  before { visit '/' }
  subject { page }

  it 'renders layout' do
    expect(page).to have_content('application#layout')
  end

  it 'renders index view' do
    expect(page).to have_content('users#index')
  end

  it 'shows a list of users' do
    expect(page).to have_selector('li', text: /Stark|Parker|Wayne/, count: 3)
  end
end
