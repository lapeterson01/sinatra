require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/places')
require('pry')

get('/') do
    @list = Place.all()
    erb(:places)
end

post('/') do
    name = params["name"]
    place = Place.new(name)
    place.save()
    @list = Place.all()
    erb(:places)
end

get('/places/:id') do
    @place = Place.find(params[:id])
    erb(:place)
end