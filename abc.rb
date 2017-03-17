letters = {"1" => ["1"],
       "2" => ["a", "b", "c"],
       "3" => ["d", "e", "f"],
       "4" => ["g", "h", "i"],
       "5" => ["j", "k", "l"],
       "6" => ["m", "n", "o"],
       "7" => ["p", "q", "r", "s"],
       "8" => ["t", "u", "v"],
       "9" => ["w", "x", "y", "z"]}

# digits = "6686787825".split ''
# digits = "2282668687".split ''
p "Please Enter 10 digit phone number:: "
digits = gets.chomp.split ''

p "====Start Time #{Time.now}==="
# Total number of combinations
n = digits.inject(1) { |a,b| a * letters[b].size }

dictionarywords = {}

File.open("/usr/share/dict/words") do |file|
  file.each do |line|
    dictionarywords[line.strip] = true
  end
end

words = []
0.upto n-1 do |q|
  word = []
  digits.reverse.each do |digit|
    q, r = q.divmod letters[digit].size
    word.unshift letters[digit][r]
  end
  words << word.join
end
# p words
hash_value = []
words.each do |a|
	for n in 2..a.size
		if a[0..n].split('').size >=3 && (dictionarywords[a[0..n]] && dictionarywords[a[(n+1)..a.size]] )
			if a[(n+1)..a.size].present? && a[(n+1)..a.size].size >= 3
				hash_value << [a[0..n], a[(n+1)..a.size]]
				# p "size:: #{a[0..n].split('').size} #{a[0..n]}"
	   			# p "1::#{a[0..n]}-- #{dictionarywords[a[0..n]]}" #if a == "motortruck"
   	   			# for j in (n+1)..a.size
   				# p "2::#{a[(n+1)..a.size]}-- #{dictionarywords[a[(n+1)..a.size]]}" #if a == "motortruck"
   			end
   		elsif a[0..n].split('').size == 10 && dictionarywords[a[0..n]]
   			hash_value << [a[0..n]]

   		end
   		# end
   	end
end
p hash_value
# p dictionarywords['catamounts']
p "====End Time #{Time.now}==="
# findwordfromdict(words)