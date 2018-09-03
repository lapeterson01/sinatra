require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the favorite things list', {:type => :feature}) do
    before() do
        Item.clear()
    end

    it('adds an item to the list of favorite things') do
        visit('/')
        fill_in('name', :with => 'tacos')
        click_button('Go!')
        expect(page).to have_content('tacos')
    end

    it('allows user to visit page specific to each item') do
        visit('/')
        fill_in('name', :with => 'pizza')
        click_button('Go!')
        click_link('pizza')
        expect(page).to have_content('pizza')
    end
end