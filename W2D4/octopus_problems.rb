          #Big O-ctopus and Biggest Fish#
#----------------------------------------------------#

#Sluggish Octopus - O(n^2)

def slug_oct(array) #nested loops x2
  largest_fish = ""
  array.each_with_index do |el, i|
    j = i+1
    while j < array.length
      if array[i].length > array[j].length
        largest_fish = array[i]
      else
        largest_fish = array[j]
      end
      j+=1
    end
  end
  largest_fish
end

#Dominant Octopus - O(n*log n)
def quick_sort(array)
  return array if array.length <= 1

  pivot = array[0]
  left = []
  right = []

  array[1..-1].each do |el|
    if el.length < pivot.length
      left << el
    else
      right << el
    end
  end

  dom_oct(left) + [pivot] + dom_oct(right)

end

def dom_oct(array)
  result = quick_sort(array)
end
#end result returns just sorted array. can't access an element in the output?!



#Clever Octopus - O(n)
def clev_oct(array)
  largest_fish = array[0]
  array[1..-1].each do |fish|
    largest_fish = fish if fish.length > largest_fish.length
  end
  largest_fish
end



                   #Dancing Octupus#
#----------------------------------------------------#

#Slow Dance - O(n)
def slow_dance(direction, array)
  array.each_with_index do |tile, idx|
    return idx if tile == direction
  end
end

#Constant Dance! - O(1)
def fast_dance(direction, hash)
  hash[direction]
end



if $PROGRAM_NAME == __FILE__

  fish_array = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']
  slug_oct(fish_array)
  dom_oct(fish_array)
  clev_oct(fish_array)

  tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left", "left-up" ]
  tiles_hash = {
    "up" => 0,
    "right-up" => 1,
    "right" => 2,
    "right-down" => 3,
    "down" => 4,
    "left-down" => 5,
    "left" => 6,
    "left-up" => 7
  }

  slow_dance("right-down", tiles_array)
  fast_dance("right-down", tiles_hash)

  
end