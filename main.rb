require './Player'
require './Question'

#create two players
p1 = Player.new()
p2 = Player.new()

#ask question while there is no winner
found_winner = false
winner = ""
current_player = p1

until found_winner do
  
  #ask question and receive input
  num1 = rand(1..20)
  num2 = rand(1..20)
  current_question = Question.new(num1,num2)
  current_question_string = "What does #{num1} plus #{num2} equal?"
  puts "Player #{current_player.id} : #{current_question_string}" 
  input = gets.chomp.to_i

  #check if input is true  
  answer =  current_question.checkAnswer(input)
  if(answer)
    #if true print correct message 
    puts "Player #{current_player.id} : YES! You are correct." 
  else
    #else update score and print incorrect message
    current_player.update_score
    puts "Player #{current_player.id} : Seriously? No!"
  end

  #print current scores
  p2_score = p2.print_score
  p1_score = p1.print_score
  puts "P1: #{p1_score} vs P2: #{p2_score}"

  #check if winner
  winner = p1 if p2.check_game_over
  winner = p2 if p1.check_game_over
  if winner==""    
    #if no winner, start new turn
    puts "----- NEW TURN -----"    
    #change to next player
    current_player = current_player == p1 ? p2 : p1
  else    
    #if winner, update found_winner and call gameover for another player
    found_winner = true 
  end  
end

puts "Player #{winner.id} wins with a score of #{winner.print_score}"
puts "----- GAME OVER -----"  
puts "Good Bye!"