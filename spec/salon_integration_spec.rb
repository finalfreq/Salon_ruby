require 'capybara/rspec'
require './app.rb'
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home navigation process') do
  it('links to stylists and clients page') do
    visit('/')
    click_link
