require 'capybara/rspec'
require './app.rb'
require 'spec_helper'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home navigation process', type: :feature) do
  it('links to stylists page') do
    visit('/')
    click_link('Add a Stylist here!')
    expect(page).to have_content("Welcome to the Stylists page!")
  end
end

describe('the add a stylist process', type: :feature) do
  it('adds a stylist') do
    visit('/stylists')
    fill_in('name', with: "dolly parton")
    click_button("Add Stylist")
    expect(page).to have_content('dolly parton')
  end
end

describe('stylist individual info')
