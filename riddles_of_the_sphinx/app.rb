require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/riddles_of_the_sphinx')
require('pry')

get('/') do
    erb(:riddle)
end

post('/result') do
    @answer = params.fetch('answer')
    riddle = Riddle.new()
    result = riddle.correct?(@answer)
    if result
        redirect('/success')
    else
        redirect('/failure')
    end
end

get('/success') do
    erb(:success)
end

get('/failure') do
    erb(:failure)
end