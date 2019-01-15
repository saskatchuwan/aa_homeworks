class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @player1 = name1    #store = [6]
    @player2 = name2    #store = [13]

    @current_player = @player1

    @cups = Array.new(14){[]}
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    @cups.each_with_index do |cup, idx|
      next if idx == 6 || idx == 13
      4.times {@cups[idx] << :stone}
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if @cups[start_pos-1].nil?
    raise "Starting cup is empty" if @cups[start_pos-1].empty?
  end

  def make_move(start_pos, current_player_name)
    hand_of_stones = @cups[start_pos]

    i = start_pos % 13
    
    until hand_of_stones.empty?
      if  (current_player_name == @player2 && i == 6 ) || (current_player_name == @player1 && i == 13)
        i+=1
        next
      else
        @cups[i] << hand_of_stones.shift
        i+=1
      end
    end
    
    # render
    next_turn(i-1)

  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if @cups[ending_cup_idx].empty?
      :switch
    elsif (ending_cup_idx == 6 && @current_player == @player1) || (ending_cup_idx == 13 && @current_player == @player2)
      :prompt
    else
      ending_cup_idx
    end

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all?{|cup| cup.empty?} || @cups[7..12].all?{|cup| cup.empty?}
    false
  end

  def winner
    if @cups[6].length == @cups[13].length
      return :draw
    elsif @cups[6].length > @cups[13].length
      return @player1
    else
      return @player2
    end

  end
end
