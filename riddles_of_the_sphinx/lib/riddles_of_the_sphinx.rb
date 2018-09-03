class Riddle
    def correct?(answer)
        @answer = answer.downcase.eql?('man')
    end
end