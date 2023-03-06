require './Player'
require './Game'

#create two players
p1 = Player.new()
p2 = Player.new()

#start the game
game = Game.new(p1,p2)
game.start_game
