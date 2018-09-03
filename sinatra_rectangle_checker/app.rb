require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/rectangle')

get('/') do
    erb(:input)
end

post('/output') do
    @length = params.fetch("length")
    @width = params.fetch("width")
    rectangle = Rectangle.new(@length, @width)
    if rectangle.square?
        @string_to_display = "This is a square."
    else
        @string_to_display = "This is not a square."
    end
    erb(:output)
end