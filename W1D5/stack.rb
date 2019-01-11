# LIFO - Last in First Out

#[last,_,_,first]

class Stack

  attr_accessor :array

  def initialize
    @array = []
  end

  def push(el)
    @array = @array + [el]
  end

  def pop
    popped = @array[-1]
    #reset original array
    @array = @array[0..-2]
    popped
  end

  def peek
    @array[-1]
  end
end