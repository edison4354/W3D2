class ComputerPlayer
    def initialize
        @known_cards = Hash.new() {|hash, key| hash[key]=[] }
        @matched_cards = []
    end

    def receive_revealed_card(pos, value)
        @known_cards[value] << pos
    end

    def receive_match(pos1, pos2)
        @matched_cards += [pos1, pos2]
    end

    def make_guess
        @known_cards.each do |k, v|
            return v[0] if v.length == 2
        end
        row = rand(0...4)
        col = rand(0...4)
        pos = row,col

        while @known_cards.values.flatten(1).include?(pos)
            row = rand(0...4)
            col = rand(0...4)
            pos = row,col
        end
        return pos
    end

    def make_guess_2
        @known_cards.each do |k, v|
            return v[1] if v.length == 2
        end
        row = rand(0...4)
        col = rand(0...4)
        pos = row,col

        while @known_cards.values.flatten(1).include?(pos)
            row = rand(0...4)
            col = rand(0...4)
            pos = row,col
        end
        return pos
    end


end
