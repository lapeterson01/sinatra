require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/maze')
require('pry')
enable :sessions

get('/') do
    session[:maze] = Maze.new()
    erb(:start)
end

post('/result') do
    direction = params.keys.join
    session[:result] = session[:maze].turn(direction)
    dead_end = session[:maze].dead_end?
    win = session[:maze].win?
    if dead_end
        redirect('/dead_end')
    elsif win
        redirect('/finish')
    else
        redirect('/rooms').params(redirect)
    end
end

get('/rooms') do
    @room = session[:result]
    erb(:rooms)
end

get('/dead_end') do
    @room = session[:result]
    erb(:dead_end)
end

get('/finish') do
    erb(:finish)
end