
htable = ["", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"]
$data = []
def printWordsUtil(number, curr_digit, output, n, htable, as=nil, key= nil, hash_v={})
	i = 0;
	if as
		# p curr_digit
	end
	if (curr_digit == n)
		if as
		  # p "=========="
		  dictionaryword = findwordfromdict(output.join(''))
		  if !hash_v[key].include?(output.join('')) && dictionaryword
		    hash_v[key] << output.join('')
		    $data << output.join('')
		  p hash_v[key]
		  end
		  # p output.join('')
		else
			dictionaryword = findwordfromdict(output.join(''))
			if dictionaryword
			# p output.join('')
			$data << output.join('')
			end
			
		end
		# if dictionaryword and as.nil?
		# 	# p "sds"
		# 	curr_digit = 0
		# 	key = output.join('')
		# 	hash_v[key] = []
		# 	# p number.length - n
		#   printWordsUtil(number[n..(number.length)], curr_digit, [], (number.length - n), htable, true, key, hash_v)
		# end
		return
	end
	 a = htable[number[curr_digit]].length rescue nil
	if a
		# p number if as 
		# p htable[number[curr_digit]][i] if as
	  for i in 0..htable[number[curr_digit]].length
		if htable[number[curr_digit]][i]
			output[curr_digit] = htable[number[curr_digit]][i]
			printWordsUtil(number, curr_digit+1, output, n, htable, as, key, hash_v)
			if (number[curr_digit] == 0 || number[curr_digit] == 1)
				return
			end
		end
	  end
	end
end

def findwordfromdict(output)
	words = {}
	
	File.open("/usr/share/dict/words") do |file|
	  file.each do |line|
	    words[line.strip] = true
	  end
	end
	words[output]
end

def printWords(number,n, htable)
	result = []
	hash_v = {}
	printWordsUtil(number, 0, result, n, htable, nil,nil,hash_v)
	p hash_v
end

def start(htable, number, index=3)
	# number = [6,6,8]
	p number
	number1 = number[0..index]
	number2 = number[index..number.length]
	original = []
	for n in 3..number.length-3
 		# n = 4
		printWords(number, n, htable)
	p "result::"
	p value1 = $data
	   # for i in 0..number.length-n
	   	p number[(n+1)..number.length-1]
	   	printWords(number[(n+1)..number.length-1], (number.length-n), htable)
		  p "result::"
		  p value2 = $data
		# end
		if value2.present?
			original << [value1, value2]
		end
		# start(htable, number1, index+1) if index <= 4
	end
	p original
	return 0;
end
input = 6686787825
start(htable, input.to_s.split('').map(&:to_i))