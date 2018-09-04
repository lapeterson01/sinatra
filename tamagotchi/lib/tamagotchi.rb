class Tamagotchi
    def initialize(name)
        @name = name
        @food_level = 10
        @sleep_level = 10
        @activity_level = 10
    end

    def name
        @name
    end

    def food_level
        @food_level
    end

    def sleep_level
        @sleep_level
    end

    def activity_level
        @activity_level
    end

    def is_alive
        @food_level > 0
    end

    def set_food_level(food_level)
        @food_level = food_level
    end

    def time_passes
        @food_level -= 1
    end
end