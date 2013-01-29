f = File.open("beautiful_stringstxt.txt")
output = File.new("output.txt", "w")
cases = f.gets
cases.to_i.times do |i|
  string = gets
  letter_count = {}
  string.downcase!.gsub!(/\W+/, '')
  string.each_char do |c|
    letter_count[c]=0 if letter_count[c].nil?
    letter_count[c]=letter_count[c]+1
  end
  values = letter_count.values
  values = values.sort{|x,y| y <=> x }
  num = 26
  total = 0
  values.each do |v|
    total = total + v*num
    num = num - 1
  end
  output.puts "Case ##{(i+1)}: #{total}"
end
