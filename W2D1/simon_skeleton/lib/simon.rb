class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize(sequence_length=1, game_over=false, seq=[])
    @sequence_length = sequence_length
    @game_over = game_over
    @seq  = seq
  end

  def play
    until self.game_over
      take_turn
    end

    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    if !self.game_over
      round_success_message
      self.sequence_length += 1
    end
  end

  def show_sequence
    add_random_color
  end

  def require_sequence
    puts "Now it's your turn! Please repeat the pattern, by entering each color one by one."
    
    self.sequence_length.times do |i|
      color_step = gets.chomp
      break if !COLORS.include?(color_step)
    end

    game_over = true
  end

  def add_random_color
    self.seq << COLORS.sample
  end

  def round_success_message
    puts "Excellent! You followed Simon's pattern. On to the next round."
  end

  def game_over_message
    puts "Aw better luck next time"
  end

  def reset_game
    self.sequence_length = 1
    self.game_over = false
    self.seq = []
  end
end


if __FILE__ == $PROGRAM_NAME
  game = Simon.new()
  game.play
end