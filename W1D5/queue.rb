# FIFO - First in First Out

#[last,_,_,first]

require 'thread'
class Queue

  attr_accessor :array

  def initialize
    @array = []
  end

  def enqueue(el)
    @array = [el] + @array
  end

  def dequeue
    dequeued = @array[-1]
    @array = @array[0..-2]
    dequeued
  end

  def peek
    @array[-1]
  end

end