require('rspec')
require('my_hash')

describe(MyHash) do
    describe('#myFetch') do
        it('retrieves a stored value by its key') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            expect(test_hash.myFetch('kitten')).to(eq('cute'))
        end
    end

    describe('#myHasKey?') do
        it('returns true if key exists in hash') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            expect(test_hash.myHasKey?('kitten')).to(eq(true))
        end

        it('returns false if key does not exist in hash') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            expect(test_hash.myHasKey?('puppy')).to(eq(false))
        end
    end

    describe('#myHasValue?') do
        it('returns true if value exists in hash') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            expect(test_hash.myHasValue?('cute')).to(eq(true))
        end

        it('returns false if value does not exist in hash') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            expect(test_hash.myHasValue?('ugly')).to(eq(false))
        end
    end

    describe('#myLength') do
        it('returns the length of the hash') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            test_hash.myStore('puppy', 'also cute')
            expect(test_hash.myLength()).to(eq(2))
        end
    end

    describe('#myMerge') do
        it('combines two already existing hashes') do
            test_hash = MyHash.new()
            test_hash.myStore('kitten', 'cute')
            test_hash_2 = {'puppy' => 'also cute'}
            expect(test_hash.myMerge(test_hash_2)).to(eq({"kitten" => 'cute', 'puppy' => 'also cute'}))
        end
    end
end