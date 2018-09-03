require('rspec')
require('parcels')

describe(Parcel) do
    describe('#volume') do
        it('returns the volume of a parcel given its dimensions') do
            test_parcel = Parcel.new(3, 3, 3, 6, 300)
            expect(test_parcel.volume()).to(eq(27))
        end
    end

    describe('#shipping_cost') do
        it('returns the shipping cost of a parcel given its dimensions, weight, and distance of travel') do
            test_parcel = Parcel.new(3, 3, 3, 6, 300)
            expect(test_parcel.shipping_cost()).to(eq(2.63))
        end
    end
end