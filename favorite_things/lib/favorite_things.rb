require('pry')

class Item
    @@list = []
    attr_reader :id
    attr_accessor :name :rank
    
    def initialize(name)
        @name = name
        @id = @@list.length + 1
    end

    def self.all()
        @@list
    end

    def save
        if !@@list.include?(self)
            @@list.push(self)
        end
    end

    def self.clear()
        @@list = []
    end

    def self.find(id)
        item_id = id.to_i()
        @@list.each do |item|
            if item.id == item_id
                return item
            end
        end
    end

    def rank(rank)
        rank_doesnt_exist = true
        @@list.each do |item|
            if item.get_rank.eql?(rank)
                rank_doesnt_exist = false
            end
        end
        if rank_doesnt_exist
            @rank = rank
        end
    end

    def get_rank
        if @rank
            return @rank
        else
            return 'no rank'
        end
    end

    def self.sort
        new_list = []
        counter = 1
        until counter.eql?(@@list.length + 1)
            @@list.each do |item|
                if item.get_rank.eql?(counter)
                    new_list.push(item)
                end
            end
            counter += 1
        end
        @@list = new_list
    end
end