# just my first attempt in doing this problem -- functionally equivalent as the second one but overly verbose
# def sum_to(n)
#   arr = n.downto(1).to_a
#   return arr.first if arr.length <= 1
#   arr[0] + sum_to(arr[1])
# end

def sum_to(n)
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(arr)
  return arr.first if arr.length <= 1
  arr[0] + add_numbers(arr[1..-1])
end

#for gamma_fnc(0) test case, getting stack overflow, not nil
def gamma_fnc(n)
  return 1 if n == 1
  (n-1) * gamma_fnc(n-1)
end

def ice_cream_shop(flavors, favorite)
  return flavors[0] if flavors.length == 1

  if flavors[0] == favorite
    return true
  else
    ice_cream_shop(flavors[1..-1], favorite)
  end

end

#getting nomethoderror for reverse("") not ""
def reverse(str)
  return str if str.length == 1
  reverse(str[1..-1]) + str[0]
end