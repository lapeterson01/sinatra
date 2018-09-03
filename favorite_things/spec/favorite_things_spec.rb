require('rspec')
require('favorite_things')

describe('Item') do
    before() do
        Item.clear()
    end

    describe('.all') do
        it('is empty at first') do
            expect(Item.all()).to(eq([]))
        end
    end

    describe('#save') do
        it('saves an item to the list of items') do
            item = Item.new("tacos")
            item.save()
            expect(Item.all()).to(eq([item]))
        end

        it('will not add an item to the list twice') do
            item = Item.new("tacos")
            item.save()
            item.save()
            expect(Item.all()).to(eq([item]))
        end
    end

    describe('.clear') do
        it('clears all items from the list') do
            item = Item.new('tacos')
            item.save()
            Item.clear()
            expect(Item.all()).to(eq([]))
        end
    end

    describe('#id') do
        it('increments an id by 1 each time a new item is added') do
            item = Item.new('tacos')
            item.save()
            item2 = Item.new('pizza')
            item2.save()
            expect(item.id()).to(eq(1))
            expect(item2.id()).to(eq(2))
        end
    end

    describe('.find') do
        it('finds an item based on its id') do
            item = Item.new('tacos')
            item.save()
            item2 = Item.new('pizza')
            item2.save()
            expect(Item.find(1)).to(eq(item))
            expect(Item.find(2)).to(eq(item2))
        end
    end

    describe('#rank') do
        it('ranks an item in the list') do
            item = Item.new('tacos')
            item.save()
            item.rank(1)
            expect(item.get_rank()).to(eq(1))
        end

        it('will not add the same ranking to the list') do
            item = Item.new('tacos')
            item.save()
            item.rank(1)
            item2 = Item.new('pizza')
            item2.save()
            item2.rank(1)
            expect(item2.get_rank()).to(eq('no rank'))
        end
    end

    describe('#get_rank') do
        it('retrieves rank of an item in the list') do
            item = Item.new('tacos')
            item.save()
            item.rank(1)
            expect(item.get_rank()).to(eq(1))
        end

        it('returns "no rank" if no rank exists for item') do
            item = Item.new('tacos')
            item.save()
            expect(item.get_rank()).to(eq('no rank'))
        end
    end

    describe('.sort') do
        it('sorts items in list by rank') do
            item = Item.new('tacos')
            item.save()
            item.rank(2)
            item2 = Item.new('pizza')
            item2.save()
            item2.rank(1)
            expect(Item.sort()).to(eq([item2, item]))
        end
    end
end