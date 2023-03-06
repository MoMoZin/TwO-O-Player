require './Question'
require './Player'

class Game

  attr_reader :p1, :p2
  attr_accessor :winner, :current_player

  def initialize(p1,p2)
    @p1=p1
    @p2=p2
    @winner = ""
    @current_player = p1
  end

  def start_game
    while winner == "" do #change to use winner
      #ask question and receive input
      ask_question

      #print current scores
      print_players_status

      #check if winner
      has_winner = has_winner?  

      #if winner then continue
      continue unless has_winner

       #end the game if no winner
      end_game if has_winner
    end   
  end

  private
  def ask_question
    current_question = Question.new()
    puts "Player #{current_player.id} : #{current_question.ask_question}" 
    input = gets.chomp.to_i

    #check if input is true  
    isCorrect =  current_question.checkAnswer(input)
    if(isCorrect)
      #if true print correct message 
      puts "Player #{current_player.id} : YES! You are correct." 
    else
      #else update score and print incorrect message
      current_player.decrease_score
      puts "Player #{current_player.id} : Seriously? No!"
    end
  end

  def print_players_status
    p2_score = p2.get_score
    p1_score = p1.get_score
    puts "P1: #{p1_score} vs P2: #{p2_score}"
  end

  def has_winner?
    game_over = current_player.check_game_over
    self.winner = current_player == p1 ? p2 : p1 if game_over  
    return winner == "" ? false : true
  end

  def continue
    #if no winner, start new turn
    puts "----- NEW TURN -----"    
    #change to next player
    self.current_player = current_player == p1 ? p2 : p1 
  end

  def end_game
    puts "Player #{winner.id} wins with a score of #{winner.get_score}"
    puts "----- GAME OVER -----"  
    puts "Good Bye!"
  end
end