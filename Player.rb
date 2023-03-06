class Player

  attr_accessor :score
  attr_reader :lives, :id

  @@player_list =[]

  def initialize()
    @lives = 3
    @score = 3
    add_player
  end  

  def add_player
    if @@player_list.empty?
      @id = 1
    else
      last_player_id = @@player_list.last
      @id =  last_player_id +1
    end    
    @@player_list << @id
  end

  def print_score
    "#{score}/#{lives}"
  end

  def update_score
    self.score -= 1
  end

  def check_game_over
    score == 0
  end

end
