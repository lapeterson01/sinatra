require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('tamagotchi', {:type => :feature}) do
    it('checks the status of tamagotchis hunger') do
        visit('/')
        click_link('Food Level: 10')
        expect(page).to have_content('food level')
    end

    it('allows user to feed tamagotchi') do
        visit('/')
        click_link('Food Level: 10')
        click_button('Feed!')
        expect(page).to have_content('Tamagotchi')
    end
end