require 'rubygems'
require 'algorithms'
include Containers

f = File.open("i.txt")
#output = File.new("output.txt", "w")
cases = f.gets
cases.to_i.times do |i|
  firstl = f.gets
  firstl = firstl.split(" ")
  n = firstl[0].to_i
  k = firstl[1].to_i
  
  
  total_nums = (0..k).to_a
  final = []
  last = 0
  
  secondl = f.gets
  secondl = secondl.split(" ")
  a = secondl[0].to_i
  b = secondl[1].to_i
  c = secondl[2].to_i
  r = secondl[3].to_i
  
  m[0] = a
  (1..(k-1)).each do |index|
  value = (b*m[index-1]+c)%r
    m[index] = value
  end
  total_nums = total_nums - first_nums
  minheap = MinHeap.new
  total_nums.each do |num|
    minheap.push num
  end
  (k..(n-1)).each do |index|
    aux = m[index%k]
    value = minheap.min!
    m[index%k] = value
    how_many[value]+=1
    if aux <= k
      if how_many[aux] > 0
        how_many[aux]-=1
      end
      if !minheap.has_key?(aux) and how_many[aux] == 0
        minheap.push(aux)
      end
    end
  end
  puts m.to_s
  puts("Case ##{i+1}: #{m[n%k]}")
end
