require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the maze', {:type => :feature}) do
    it('goes to room in direction selected by user') do
        visit('/')
        click_button('Left!')
        expect(page).to have_content('You have reached room 2')
    end

    it('goes to room in direction selected by user') do
        visit('/')
        click_button('Right!')
        expect(page).to have_content('You have reached room 3')
    end
end