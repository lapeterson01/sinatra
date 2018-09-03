require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the riddle', {:type => :feature}) do
    it('processes the user entry and returns whether it is correct or not') do
        visit('/')
        fill_in('answer', :with => 'Man')
        click_button('Go!')
        expect(page).to have_content('That is correct!')
    end

    it('processes the user entry and returns whether it is correct or not') do
        visit('/')
        fill_in('answer', :with => 'Dog')
        click_button('Go!')
        expect(page).to have_content('That is not correct')
    end
end