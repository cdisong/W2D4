require 'benchmark'


def my_min(list)
  smallest = nil
    list.each_with_index do |el1, i|
      list.each_with_index do |el2, j|
      next if i == j
      if list[i] < list[j] && smallest.nil?
        smallest = list[i]
      elsif !smallest.nil? && (list[j]<list[i] && list[j] < smallest)
        smallest = list[j]
      elsif !smallest.nil? && (list[i]<list[j] && list[i]<smallest)
        smallest = list[i]
      end
    end
  end
  smallest
end

puts Benchmark.measure{my_min([ 5,3,-7,17,2,3,4,5,6,7,8,22,345,4527,35687,134,33,65783,567,245612,25612724,67,-3452346])}

def my_min2(list)
  smallest = list.first
    list.each do |el1|
      if el1 < smallest
        smallest = el1
      end
    end
  smallest
end

puts Benchmark.measure{my_min2([ 5,3,-7,17,2,3,4,5,6,7,8,22,345,4527,35687,134,33,65783,567,245612,25612724,67,-3452346])}

def inefficient_sub_sum(arr)
  sub_arrays = []
  (0...arr.length).each do |start|
    i = start
    (i...arr.length).each do |finish|
      sub_arrays << arr[start..i]
      i += 1
    end
  end
  max = nil
  sub_arrays.each_with_index do |arr, idx|
    if max.nil?
      max = arr.reduce(:+)
    elsif arr.reduce(:+) > max
      max = arr.reduce(:+)
    end
  end
  max
end
puts Benchmark.measure{inefficient_sub_sum([5,3,-7,17,2,3,4,5,6,7,8,22,345,4527,35687,134,33,65783,567,245612,25612724,67,-3452346])}

def sub_sum(arr)
  largest = arr.first
  current = arr.first

  return arr.max if arr.all? { |num| num < 0 }

  arr.drop(1).each do |num|
    current = 0 if current < 0
    current += num
    largest = current if current > largest
  end

  largest
end
