class MyHash
    def initialize
        @hash = {}
    end

    def myStore(key, value)
        @hash[key] = value
    end

    def myFetch(key)
        @hash[key]
    end

    def myHasKey?(key)
        if @hash[key]
            true
        else
            false
        end
    end

    def myHasValue?(value)
        @hash.each do |item|
            if item[1].eql?(value)
                return true
            end
        end
        false
    end

    def myLength
        count = 0
        @hash.each {|item| count += 1}
        count
    end

    def myMerge(new_hash)
        new_hash.each do |item|
            @hash[item[0]] = item[1]
        end
        @hash
    end
end