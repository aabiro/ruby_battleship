class Player
    attr_accessor :hits

    def initialize(name, board, choices, hits)
        @name = name
        @board = board
        @choices = []
        @hits = 0
    end

    def take_shot(tile_choice, board)
        puts board.inspect
        puts tile_choice
        score = board.grid[letter_conversion[tile_choice.first.upcase]][tile_choice.last.to_i]
        if score == nil
            puts "You already chose that tile, try again.."
        elsif score == 1
            puts "Not a hit.."
            board[tile_choice.first][tile_choice.last] = nil
        else
            puts "You hit the opponents Battle Ship"
            board[tile_choice.first][tile_choice.last] = nil
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
            'F' => 5
        }
    end
end