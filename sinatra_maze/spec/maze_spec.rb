require('rspec')
require('maze')

describe(Maze) do
    describe('#turn') do
        it('moves player one step toward the left') do
            test_maze = Maze.new()
            expect(test_maze.turn('left')).to(eq(2))
        end

        it('moves player one step toward the right') do
            test_maze = Maze.new()
            expect(test_maze.turn('right')).to(eq(3))
        end
    end

    describe('#dead_end?') do
        it('returns true if player has reached a dead end') do
            test_maze = Maze.new()
            test_maze.turn('left')
            test_maze.turn('left')
            expect(test_maze.dead_end?()).to(eq(true))
        end

        it('returns false if player has not reached a dead end') do
            test_maze = Maze.new()
            test_maze.turn('left')
            expect(test_maze.dead_end?()).to(eq(false))
        end
    end

    describe('#win?') do
        it('returns true if player has won') do
            test_maze = Maze.new()
            test_maze.turn('right')
            test_maze.turn('left')
            test_maze.turn('left')
            test_maze.turn('left')
            test_maze.turn('left')
            test_maze.turn('right')
            test_maze.turn('left')
            expect(test_maze.win?()).to(eq(true))
        end

        it('returns false if player has not won') do
            test_maze = Maze.new()
            test_maze.turn('right')
            expect(test_maze.win?()).to(eq(false))
        end
    end
end