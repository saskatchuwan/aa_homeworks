class LRUCache
  def initialize(size)
    @size = size
    @cache = Array.new        #initialize empty array
  end

  def count
    # returns number of elements currently in cache
    @cache.length
  end

  def add(el)
    # adds element to cache according to LRU principle
    if @cache.include?(el)          
      idx_existing_el = @cache.index(el)       
      left = @cache[0...idx_existing_el]
      right = @cache[idx_existing_el+1..-1]

      @cache = left + right + [el]

    elsif !@cache.include?(el) && self.count < @size
      @cache.push(el)

    elsif !@cache.include?(el) && self.count == @size
      @cache.shift #remove LRU to make room for new el
      @cache.push(el)

    else
    end
  end

  def show
    # shows the items in the cache, with the LRU item first
    @cache
  end

  private
  # helper methods go here!

end

if $PROGRAM_NAME == __FILE__
  johnny_cache = LRUCache.new(4)
  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})

  p johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]
end