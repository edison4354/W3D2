require_relative 'board.rb'
require_relative 'human_player.rb'

class Game
    def initialize
        @board = Board.new()
        @prev_guessed = 0
    end

    def play
        already_guessed = []
        b = Board.new()
        b.populate
        while !b.won?
            system("clear")
            @prev_guessed=0
            b.render
            @prev_guessed = HumanPlayer.new().make_guess
            if !already_guessed.include?(b.grid[@prev_guessed[0]][@prev_guessed[1]])
                b.reveal(@prev_guessed)
                b.render
                pos = HumanPlayer.new().make_guess
                b.reveal(pos)
                b.render
                if b.grid[@prev_guessed[0]][@prev_guessed[1]] == b.grid[pos[0]][pos[1]]
                    b.grid[pos[0]][pos[1]].reveal
                    b.grid[@prev_guessed[0]][@prev_guessed[1]].reveal
                    already_guessed<<b.grid[pos[0]][pos[1]]

                else
                    b.grid[pos[0]][pos[1]].hide
                    b.grid[@prev_guessed[0]][@prev_guessed[1]].hide
                end
                puts "----------------next--try------------------"
            else
              puts "Position already guessed!"
            end
            sleep(3)
        end
        puts "you won"
    end
end
