class Player
    attr_accessor :hits

    def initialize(name, board, choices, hits)
        @name = name
        @board = board
        @choices = []
        @hits = 0
    end

    def take_shot(tile_choice, board)
        letter = letter_conversion[tile_choice.first.upcase]
        number = tile_choice.last.to_i
        score = board.grid[letter][number]

        if score == nil
            puts "You already chose that tile, try again.."
        elsif score == 1
            puts "Not a hit.."
            board.grid[letter][number] = nil
        else
            puts "You hit the opponents Battle Ship"
            board.grid[letter][number] = nil
            @hits += 1
        end
    end

    def letter_conversion
        {
            'A' => 0,
            'B' => 1,
            'C' => 2,
            'D' => 3,
            'E' => 4,
            'F' => 5,
            'G' => 6,
            'H' => 7
        }
    end
end