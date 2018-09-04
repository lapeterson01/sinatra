require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/tamagotchi')
enable :sessions
require('pry')

get('/') do
    my_pet = Tamagotchi.new('Lil Dragon')
    @name = my_pet.name()
    @food_level = my_pet.food_level
    @sleep_level = my_pet.sleep_level
    @activity_level = my_pet.activity_level
    session[:pet] = my_pet
    erb(:tamagotchi)
end

get('/levels/:need') do
    my_pet = session[:pet]
    @name = my_pet.name
    @need = params['need']
    if @need.eql?('food')
        @command = 'Feed!'
    elsif @need.eql?('sleep')
        @command = 'Sleep!'
    else
        @command = 'Play!'
    end
    method = @need + '_level'
    @level = my_pet.send(method.to_sym)
    erb(:needs)
end

post('/meet_need') do
    my_pet = session[:pet]
    my_pet.set_food_level(10)
    redirect('/')
end