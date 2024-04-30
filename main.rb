require_relative 'game'

puts "Welcome to the Math Game!"
puts "Player 1, please enter your name:"
player1_name = gets.chomp
puts "Player 2, please enter your name:"
player2_name = gets.chomp

game = Game.new(player1_name, player2_name)
game.start_game