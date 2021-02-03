class Board < BoardBase
    def initialize
        @letters = [*'a'..'h']
        @numbers = [*1..8]
        @grid = Array.new(8) { Array.new(8) { 0 } }
    end

    def create_board(player)
        new_board = Board.new
        player.board = new_board
    end

    def place_battleship(alignment, tile)
        tile = self.valid_tile(tile)
        if !tile.nil?
            letter = tile.first
            number = tile.last.to_i
            battleship_tiles = []

            if alignment == 'vertical'
                begin
                    for i in (0..3)
                        @grid[letter_conversion[letter]][number + i] = 1
                        battleship_tiles << @grid[letter][number + i]
                    end    
                rescue => exception
                    puts exception
                    puts "Does not fit here"
                end
                
            else
                begin
                    index = @letters.find_index(letter)
                    for i in (0..3)
                        letter = @letters[index + i]
                        @grid[letter_conversion[letter]][number] = 1
                        battleship_tiles << @grid[letter][number]
                    end
                rescue => exception
                    puts exception
                    puts "Does not fit here"
                end           
            end

            puts "Placed Battle Ship at #{battleship_tiles.inspect}"
        else
            return 
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

    def valid_starting_tiles(alignment)
        result = []
        if alignment.downcase == 'vertical'
            result = [
                "A1", "A2", "A3", "A4", "A5", "A6", "A7", "A8",
                "B1", "B2", "B3", "B4", "B5", "B6", "B7", "B8",
                "C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8",
                "D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8",
                "E1", "E2", "E3", "E4", "E5", "E6", "E7", "E8",
                "F1", "F2", "F3", "F4", "F5", "F6", "F7", "F8",
            ]
        else
            result = [
                "A1", "A2", "A3", "A4", "A5", "A6",
                "B1", "B2", "B3", "B4", "B5", "B6",
                "C1", "C2", "C3", "C4", "C5", "C6",
                "D1", "D2", "D3", "D4", "D5", "D6",
                "E1", "E2", "E3", "E4", "E5", "E6",
                "F1", "F2", "F3", "F4", "F5", "F6",
                "G1", "G2", "G3", "G4", "G5", "G6",
                "H1", "H2", "H3", "H4", "H5", "H6",
            ]
        end
        result
    end
end