require_relative 'board_base.rb'
require_relative 'player.rb'
require_relative 'board.rb'

puts "Creating boards..."
board1 = Board.new # player 1's board
board2 = Board.new # player 2's board

puts "Creating Players..."
player1 = Player.new("Player 1", board1, [], 0)
player2 = Player.new("Player 2", board2, [], 0)

alignment = nil
until alignment == 'h' || alignment == 'v'
    puts "Choose your Battle ships direction, horizontal or vertical (h or v)? : "
    alignment = gets.chomp
end

if alignment == 'h' 
    alignment = 'horizontal'
    puts "You chose horizontal"
end
if alignment == 'v'
    alignment = 'vertical'
    puts "You chose vertical"
end


starting_tiles = board1.valid_starting_tiles(alignment)
tile = nil
until starting_tiles.include?(tile)
    puts "Choose your Battle Ship's starting topmost, leftmost tile (top left - A1, bottom right - H8) : "
    tile = gets.chomp
    puts "Invalid selection" unless starting_tiles.include?(tile)
end

alignments = ["h", "v"]
player2_alignment = alignments[rand(1)]
valid_tiles = board2.valid_starting_tiles(player2_alignment)
player2_tile = valid_tiles[rand(valid_tiles.size)]


board1.place_battleship(alignment, tile)
board2.place_battleship(player2_alignment, player2_tile)
puts "Player 2 placed their Battleship"

until player1.hits == 3 || player2.hits == 3

    tile = nil
    until tile
        puts "Player 1, your turn to shoot, choose your tile: "
        tile = board2.valid_tile(gets.chomp)
    end

    player1.take_shot(tile, board2)
    if player1.hits == 3
        puts "Player 1 wins!"
        break
    end

    random_tile = valid_tiles[rand(valid_tiles.size)]
    player2.take_shot(board1.valid_tile(random_tile), board1)
    if player2.hits == 3
        puts "Player 2 wins!"
        break
    end
end

