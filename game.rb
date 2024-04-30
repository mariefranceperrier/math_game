require_relative 'player'
require_relative 'math_question'

class Game
  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name)
    @player2 = Player.new(player2_name)
    @current_player = @player1
  end

  def start_game
    until game_over?
      play_turn
      switch_turn
    end
    announce_winner
  end

  private

  def play_turn
    question = MathQuestion.new
    puts "#{@current_player.name}: #{question.question}"
    player_answer = gets.chomp
    if question.correct_answer?(player_answer)
      puts "YES! You are correct."
    else
      puts "Seriously? No!"
      @current_player.reduce_life
    end
    update_scores
  end

  def switch_turn
    if @current_player.lives > 0
    puts "---------- NEW TURN ----------"
    end
    @current_player = @current_player == @player1 ? @player2 : @player1
  end

  def update_scores
    puts "#{@player1.name}: #{@player1.lives}/3 vs #{@player2.name}: #{@player2.lives}/3"
  end

  def game_over?
    @player1.game_over? || @player2.game_over?
  end

  def announce_winner
    winner = @player1.game_over? ? @player2 : @player1
    loser = @player1.game_over? ? @player1 : @player2
    puts "******* * GAME OVER * *******"
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "#{loser.name} lost the game :("
    puts "Good bye!"
  end
end
