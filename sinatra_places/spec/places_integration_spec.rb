require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the places list', {:type => :feature}) do
    before() do
        Place.clear()
    end

    it('adds an item to the list of places') do
        visit('/')
        fill_in('name', :with => 'North Carolina')
        click_button('Go!')
        expect(page).to have_content('North Carolina')
    end

    it('allows user to visit page specific to each other') do
        visit('/')
        fill_in('name', :with => 'North Carolina')
        click_button('Go!')
        click_link('North Carolina')
        expect(page).to have_content('North Carolina')
    end
end