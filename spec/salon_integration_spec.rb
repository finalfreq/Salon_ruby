require 'capybara/rspec'
require './app.rb'
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home navigation process', type: :feature) do
  it('links to stylists page') do
    visit('/')
    click_link('stylists page')
    expect(page).to have_content("Welcome to the Stylists page!")
  end
end
