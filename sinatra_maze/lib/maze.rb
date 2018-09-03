require('pry')

class Maze
    def initialize
        @current_room = 1
        @rooms = {
            1 => {
                'dead end' => false,
                'left' => 2,
                'right' => 3
            },
            2 => {
                'dead end' => false,
                'left' => 4,
                'right' => 5
            },
            3 => {
                'dead end' => false,
                'left' => 6,
                'right' => 7
            },
            4 => {
                'dead end' => true,
                'left' => 5,
                'right' => 1
            },
            5 => {
                'dead end' => true,
                'left' => 1,
                'right' => 4
            },
            6 => {
                'dead end' => false,
                'left' => 8,
                'right' => 9
            },
            7 => {
                'dead end' => true,
                'left' => 1,
                'right' => 6
            },
            8 => {
                'dead end' => false,
                'left' => 10,
                'right' => 11
            },
            9 => {
                'dead end' => true,
                'left' => 3,
                'right' => 8
            },
            10 => {
                'dead end' => false,
                'left' => 12,
                'right' => 13
            },
            11 => {
                'dead end' => true,
                'left' => 6,
                'right' => 10
            },
            12 => {
                'dead end' => false,
                'left' => 14,
                'right' => 15
            },
            13 => {
                'dead end' => true,
                'left' => 8,
                'right' => 12
            },
            14 => {
                'dead end' => false,
                'left' => 16,
                'right' => 17
            },
            15 => {
                'dead end' => false,
                'left' => 19,
                'right' => 18
            },
            16 => {
                'dead end' => true,
                'left' => 17,
                'right' => 12
            },
            17 => {
                'dead end' => true,
                'left' => 12,
                'right' => 16
            },
            18 => {
                'dead end' => true,
                'left' => 12,
                'right' => 19
            },
            19 => {
                'dead end' => false
            }
        }
    end

    def turn(direction)
        @current_room = @rooms[@current_room][direction]
    end

    def dead_end?
        @rooms[@current_room]['dead end']
    end

    def win?
        @current_room.eql?(19)
    end
end