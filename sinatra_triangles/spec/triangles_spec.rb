require('rspec')
require('triangles')

describe(Triangle) do
    describe('#triangle') do
        it('returns equilateral if all 3 sides are equal length') do
            test_triangle = Triangle.new(4, 4, 4)
            expect(test_triangle.triangle()).to(eq('an equilateral triangle'))
        end

        it('returns isosceles if 2 of the 3 sides are equal length') do
            test_triangle = Triangle.new(4, 4, 3)
            expect(test_triangle.triangle()).to(eq('an isosceles triangle'))
        end

        it('returns scalene if none of the 3 sides are equal length') do
            test_triangle = Triangle.new(4, 3, 2)
            expect(test_triangle.triangle()).to(eq('a scalene triangle'))
        end

        it('returns NOT a triangle if the sum of the lengths of any two sides is less than or equal to the length of the third side') do
            test_triangle = Triangle.new(3, 2, 1)
            expect(test_triangle.triangle()).to(eq('NOT a triangle'))
        end
    end
end