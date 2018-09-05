class Contact
    @@list = []

    def initialize(arguments)
        @contact = arguments
    end

    def contact
        @contact
    end

    def update(arguments)
        arguments.keys.each do |item|
            @contact[item] = arguments[item]
        end
        @contact
    end

    def save
        @@list.push(self)
    end

    def self.all
        @@list
    end

    def self.clear
        @@list = []
    end
end