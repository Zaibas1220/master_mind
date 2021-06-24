module Logic
  def compare(guess, answer)
    temporal_guess = guess.clone
    temporal_answer = answer.clone
    @exact_number = exact_compare(temporal_guess, temporal_answer)
    @same_number = same_compare(temporal_guess, temporal_answer)
    @total_number = @exact_number+@same_number
  end

  def exact_compare(guess, answer)
    exact = 0
      answer.each_with_index do |i1,i2|
      next unless i1 == guess[i2]
      exact +=1 
      answer[i2] = "O"
      guess[i2] = "O"
    end
    exact
  end

  def same_compare(answer,guess)
    same = 0
      guess.each_index do |i|
      next unless guess[i]!="O" && answer.include?(guess[i])
      same += 1
      remove = answer.find_index(guess[i])
      answer[remove] = "X"
      guess[i] = "X"
    end
    same
  end

  def solved?(answer,guess)
   answer == guess
  end

  def show_clues(exact,same)
    exact.times {print "O"}
    same.times {print "X"}
    puts ""
  end
end