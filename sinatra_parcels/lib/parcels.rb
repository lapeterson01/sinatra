class Parcel
    def initialize(length, width, height, weight, distance)
        @length = length.to_i
        @width = width.to_i
        @height = height.to_i
        @weight = weight.to_i
        @distance = distance.to_i
    end

    def volume
        @length * @width * @height
    end

    def shipping_cost
        length_cost = @length.to_f / 12
        width_cost = @width.to_f / 12
        height_cost = @height.to_f / 12
        weight_cost = @weight.to_f / 16
        distance_cost = @distance.to_f / 200
        @cost = (length_cost + width_cost + height_cost + weight_cost + distance_cost).round(2)
    end
end