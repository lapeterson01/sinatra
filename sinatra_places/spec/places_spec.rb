require('rspec')
require('places')

describe(Place) do
    before() do
        Place.clear()
    end

    describe('.all') do
        it('retrieves all places in the places list') do
            place = Place.new('North Carolina')
            place.save()
            expect(Place.all()).to(eq([place]))
        end
    end

    describe('#save') do
        it('saves the new place to the places list') do
            place = Place.new('North Carolina')
            place.save()
            expect(Place.all()).to(eq([place]))
        end

        it('will not save the same place twice') do
            place = Place.new('North Carolina')
            place.save()
            place.save()
            expect(Place.all()).to(eq([place]))
        end
    end

    describe('.clear') do
        it('clears the list of places') do
            place = Place.new('North Carolina')
            place.save()
            expect(Place.clear()).to(eq([]))
        end
    end

    describe('#id') do
        it('increments an id by 1 each time a new item is added') do
            place = Place.new('North Carolina')
            place.save()
            place2 = Place.new("Hawai'i")
            place2.save()
            expect(place.id()).to(eq(1))
            expect(place2.id()).to(eq(2))
        end
    end

    describe('.find') do
        it('returns item from the list based on given id') do
            place = Place.new('North Carolina')
            place.save()
            expect(Place.find(1)).to(eq(place))
        end
    end
end