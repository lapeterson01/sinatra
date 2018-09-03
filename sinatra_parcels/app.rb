require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/parcels')

get('/') do
    erb(:input)
end

get('/output') do
    @length = params.fetch('length')
    @width = params.fetch('width')
    @height = params.fetch('height')
    @weight = params.fetch('weight')
    @distance = params.fetch('distance')
    parcel = Parcel.new(@length, @width, @height, @weight, @distance)
    @volume = parcel.volume
    @shipping_cost = parcel.shipping_cost
    erb(:output)
end