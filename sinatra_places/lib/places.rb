class Place
    @@list = []
    attr_reader :id
    attr_accessor :name

    def initialize(name)
        @name = name
        @id = @@list.length + 1
    end

    def self.all
        @@list
    end

    def save
        if !@@list.include?(self)
            @@list.push(self)
        end
    end

    def self.clear
        @@list = []
    end

    def self.find(id)
        id = id.to_i
        @@list.each do |place|
            if place.id.eql?(id)
                return place
            end
        end
    end
end