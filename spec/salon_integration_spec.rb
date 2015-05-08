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

describe('get stylist individual info', type: :feature) do
  it('goes to page with stylist info') do
    stylist = Stylist.new(name: "dolly parton", id: 1)
    stylist.save
    visit('/stylists')
    click_link('dolly parton')
    expect(page).to have_content('Welcome to dolly parton page!')
  end
end

describe('add client route', type: :feature) do
  it('goes to page to add client info') do
    stylist = Stylist.new(name: "dolly parton", id: 1)
    stylist.save
    visit('/')
    click_link('clients page')
    fill_in('name', with: 'joe smoe')
    select('dolly parton', from: 'stylist_id')
    click_button('Add Client')
    expect(page).to have_content("joe smoe")
  end
end

describe('visit client info page', type: :feature) do
  it('goes to page for individual client info') do
    stylist = Stylist.new(name: "dolly parton", id: 1)
    stylist.save
    client = Client.new(name: "joe smoe", id: 1, stylist_id: stylist.id)
    client.save
    visit('/clients')
    click_link('joe smoe')
    expect(page).to have_content("joe smoe")
  end
end
