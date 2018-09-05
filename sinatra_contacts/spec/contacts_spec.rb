require('rspec')
require('contacts')

describe('Contacts') do
    before() do
        Contact.clear
    end

    describe('#initialize') do
        it('creates first name, last name, job title, company, and contact type for each new contact') do
            contact = Contact.new({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
            expect(contact.contact).to eq ({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
        end
    end

    describe('#contact') do
        it('returns the contact information') do
            contact = Contact.new({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
            expect(contact.contact).to eq ({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
        end
    end

    describe('#update') do
        it('adds an address to the contact information') do
            contact = Contact.new({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
            contact.update({'address' => {'street_address' => '1600 Pennsylvania Ave NW', 'city' => 'Washington, D.C.', 'zip' => '20500'}})
            expect(contact.contact).to eq ({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business', 'address' => {'street_address' => '1600 Pennsylvania Ave NW', 'city' => 'Washington, D.C.', 'zip' => '20500'}})
        end

        it('updates job title for the contact') do
            contact = Contact.new({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
            contact.update({'job_title' => 'Astronaut'})
            expect(contact.contact).to eq ({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Astronaut', 'company' => 'RoleModel', 'contact_type' => 'Business'})
        end

        it('updates multiple items for the contact') do
            contact = Contact.new({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Software Developer', 'company' => 'RoleModel', 'contact_type' => 'Business'})
            contact.update({'job_title' => 'Astronaut', 'company' => 'United States Space Force'})
            expect(contact.contact).to eq ({'first_name' => 'Logan', 'last_name' => 'Peterson', 'job_title' => 'Astronaut', 'company' => 'United States Space Force', 'contact_type' => 'Business'})
        end
    end

    describe('#save') do
        it('saves the contact to a list') do
            contact = Contact.new({'first_name' => 'Logan'})
            contact.save
            expect(Contact.all).to eq ([contact])
        end
    end

    describe('.all') do
        it('returns the first name of every contact') do
            contact1 = Contact.new({'first_name' => 'Logan'})
            contact1.save
            contact2 = Contact.new({'first_name' => 'Cameron'})
            contact2.save
            expect(Contact.all).to eq ([contact1, contact2])
        end
    end

    describe('.clear') do
        it('clears list of contacts') do
            contact = Contact.new({'first_name' => 'Logan'})
            contact.save
            expect(Contact.all).to eq ([contact])
            Contact.clear
            expect(Contact.all).to eq ([])
        end
    end
end