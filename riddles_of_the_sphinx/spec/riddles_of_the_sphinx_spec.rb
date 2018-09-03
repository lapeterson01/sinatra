require('rspec')
require('riddles_of_the_sphinx')

describe(Riddle) do
    describe('#correct?') do
        it('returns true if the correct answer is submitted') do
            riddle = Riddle.new()
            expect(riddle.correct?('Man')).to(eq(true))
        end

        it('returns false if the incorrect answer is submitted') do
            riddle = Riddle.new()
            expect(riddle.correct?('Dog')).to(eq(false))
        end
    end
end