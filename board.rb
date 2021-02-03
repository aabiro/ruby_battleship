class Board < BoardBase
    attr_accessor :grid

    def initialize
        @letters = [*'a'..'h']
        @numbers = [*1..8]
        @grid = Array.new(8) { Array.new(8) { 1 } }
    end

    def create_board(player)
        new_board = Board.new
        player.board = new_board
    end

    def place_battleship(alignment, tile)
        tile = self.valid_tile(tile)
        if !tile.nil?
            letter = letter_conversion[tile.first]
            number = tile.last.to_i - 1
            battleship_tiles = []

            if alignment == 'vertical'
                begin
                    for i in (0..2)
                        puts "number  #{number}"
                        @grid[letter][number + i] = 2
                    end    
                rescue => e
                    puts e
                    puts "Does not fit here"
                end
                
            else
                begin
                    index = @letters.find_index(letter)
                    for i in (0..2)
                        letter = @letters[index]
                        @grid[letter][number + i] = 2
                    end
                rescue => e
                    puts e
                    puts "Does not fit here"
                end           
            end
        else
            return nil
        end
    end

    def valid_tile(tile)
        tile = tile.split('')
        if tile.size != 2  || !tile.first.match?(/[a-hA-H]+/) || !tile.last.match?(/[0-8]+/)
            puts "Invalid tile..." 
            return nil
        end
        tile
    end

    def grid
        @grid
    end
end