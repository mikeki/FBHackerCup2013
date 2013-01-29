f = File.open("i.txt")
output = File.new("output.txt", "w")
cases = f.gets
cases.to_i.times do |i|
  result = "YES"
  pstack = []
  happystack = []
  sadstack = []
  string = f.gets
  colon = false
  index = 0
  string.each_char do |c|
    if !((c >= 'a' and c <= 'z') or c == ' ' or c == ':' or c.to_i == 0 or c == "(" or c == ")")
      result = "NO"
    elsif c == '('
      if colon
        sadstack.push index
      else
        pstack.push index
      end
      colon = false
    elsif c == ')'
      if colon
        happystack.push index
      else
        if pstack.count > 0
          pstack.pop
        elsif sadstack.count > 0
          sadstack.pop
        end
      end
      colon = false
    elsif c == ':'
      colon = true
    else
      colon = false
    end
    index = index + 1
  end
  if pstack.count > 0
    pstack.each do |p|
      if happystack.count > 0
        if happystack.last > p
          pstack.pop
          happystack.pop
        end
      end
    end
  end
  if pstack.count > 0
    result = "NO"
  end
  output.puts("Case ##{i+1}: #{result}")
end
