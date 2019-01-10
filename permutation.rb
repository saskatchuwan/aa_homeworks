def permutation(arr)
  return arr if arr.length == 1

  result = []
  arr.length.times do |i|
    variations = permutation(arr[1..-1])

    variations.each do |arr|
      result << [arr[0]] + arr
    end
    
    arr.rotate!
  end
  result
end
