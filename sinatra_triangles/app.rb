require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/triangles')

get('/') do
    erb(:input)
end

post('/output') do
    @side_1 = params.fetch('side_1').to_i()
    @side_2 = params.fetch('side_2').to_i()
    @side_3 = params.fetch('side_3').to_i()
    triangle = Triangle.new(@side_1, @side_2, @side_3)
    @string_to_display = triangle.triangle
    erb(:output)
end