class Triangle
    def initialize(side_1, side_2, side_3)
        @side_1 = side_1
        @side_2 = side_2
        @side_3 = side_3
    end

    def triangle
        triangle = ''
        if @side_1 + @side_2 <= @side_3 || @side_1 + @side_3 <= @side_2 || @side_2 + @side_3 <= @side_1
            triangle = 'NOT a triangle'
        elsif @side_1.eql?(@side_2) && @side_2.eql?(@side_3)
            triangle = 'an equilateral triangle'
        elsif @side_1.eql?(@side_2) || @side_1.eql?(@side_3) || @side_2.eql?(@side_3)
            triangle = 'an isosceles triangle'
        else
            triangle = 'a scalene triangle'
        end
        triangle
    end
end