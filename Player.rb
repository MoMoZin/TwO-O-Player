class Player

  attr_accessor :score
  attr_reader :id

  @@player_list =[]

  def initialize()
    @score = 3
    add_player_id
  end  

  def get_score
    "#{score}/3"
  end

  def decrease_score
    self.score -= 1
  end

  def check_game_over
    score == 0
  end

  private
  def add_player_id
    if @@player_list.empty?
      @id = 1
    else
      last_player_id = @@player_list.last
      @id =  last_player_id +1
    end    
    @@player_list << @id
  end
end
