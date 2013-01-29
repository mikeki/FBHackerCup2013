require 'rubygems'
require 'algorithms'
include Containers

f = File.open("i.txt")
output = File.new("output.txt", "w")
cases = f.gets
cases.to_i.times do |i|
  firstl = f.gets
  firstl = firstl.split(" ")
  n = firstl[0].to_i
  k = firstl[1].to_i
  m = Array.new(k)
  how_many = Array.new((2*k)+1, 0)
  hash = {}
  first_nums = []
  original_nums = []
  total_nums = (0..(2*k)).to_a
  secondl = f.gets
  secondl = secondl.split(" ")
  a = secondl[0].to_i
  m[0] = a
  b = secondl[1].to_i
  c = secondl[2].to_i
  r = secondl[3].to_i
  
  (1..(k-1)).each do |index|
  value = (b*m[index-1]+c)%r
    m[index] = value
    if value <= k
      how_many[value] += 1
      first_nums << value
    end
  end

  total_nums = total_nums - first_nums
  total_nums.sort!
  first_nums.uniq!
  first_nums.sort!
  
  k.times do |index|
    aux = m[index]
    if original_nums.count > 0
      if total_nums[0] > original_nums[0] and how_many[original_nums[0]] == 0
        m[index] = original_nums.shift
      else
        m[index] = total_nums.shift
      end
    else
      m[index] = total_nums.shift
    end
    if aux <= k
      how_many[aux] -= 1
    end
    if aux <= k and how_many[aux] == 0
      original_nums << aux
      original_nums.sort!
    end
  end
  #puts m.to_s
  place = ((n-1)%k)-((n-k)/k)
  if place == -1
    value = k
  elsif place < 0
    place = (place % k)*-1
    value = m[place]
  else
      value = m[place]
  end
  output.puts("Case ##{i+1}: #{value}")
end
