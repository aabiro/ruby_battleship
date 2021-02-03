class BoardBase
    def valid_tile(tile)
        tile = tile.split()
        puts tile
        if tile.size != 2  || !tile.first.match?(/[a-hA-H]+/) || !tile.last.match?(/[0-8]+/)
            puts "Invalid tile..." 
            return nil
        end
        tile
    end

    def valid_starting_tiles(alignment)
        result = []
        if alignment.lower == 'vertical'
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