require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/contacts')
require('pry')

get('/') do
    @list = []
    Contact.all.each do |contact|
        @list.push(contact.contact)
    end
    erb(:contacts)
end

get('/contact/new') do
    erb(:new_contact)
end

post('/contact/new') do
    contact_args = {}
    params.keys.each do |key|
        if key
            contact_args[key] = params[key]
        end
    end
    contact = Contact.new(contact_args)
    contact.save
    redirect('/')
end