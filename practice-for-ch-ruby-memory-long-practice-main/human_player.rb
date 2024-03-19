class HumanPlayer
    def make_guess
        puts "Please enter the position of the card you'd like to flip (e.g., '2,3')"
        pos = gets.chomp.split(",")
        return pos.map! { |cord| cord.to_i}
    end
end