class Map

  attr_accessor :dict

  def initialize
    @dict = []
  end

  def set(key, value)
    #first, check to see if key already exists in some pair[0]
    #if it does, then add shovel value into array
    #if it doesn't, then add [key,value] to the map

    return @dict = @dict << [key, value] if @dict == []

    @dict.each do |pair|
      if pair[0] == key
        pair[1] = value
      else
        @dict << [key, value]
      end
    end
    @dict
  end

  def get(key)
    @dict.each do |pair|
      return pair[0] if pair[0] == key
    end
  end

  def delete(key)
    @dict.each_with_index do |pair, idx|
      if pair[0] == key && idx != @dict.length - 1
        @dict = @dict[0...idx] + @dict[idx-1..-1]
      elsif pair[0] == key && idx == 0
        @dict = @dict[1..-1]
      elsif pair[0] == key && idx == @dict.length - 1
        @dict = @dict[0...-1]
      else

      end
    end
    @dict[0]
  end

  def show
    @dict[-1]
  end

end