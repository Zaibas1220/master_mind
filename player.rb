require_relative "logic.rb"

class CodeBreaker
  include Logic

  attr_accessor :random_number, :guess, :exact_number, :same_number

  def initialize
    @random_number = generate_code
  end

  def generate_code
    arr = [rand(1..6),rand(1..6),rand(1..6),rand(1..6)]
    arr.map(&:to_s)
  end


  def play
    start  
    won(random_number,guess)
  end
  def start
    turn = 1
    while turn <= 10
      @guess = player_input.split(//)
      
      break if solved?(random_number,guess)
      check_guess
     
      puts "Chances left:- #{10-turn}
      \n___________"

      turn += 1 
    end
  end
 

  def check_guess
    compare(random_number,guess)
    show_clues(exact_number,same_number)
  end

  def player_input
    input = gets.chomp!
    return input if input.match(/^[1-6]{4}$/)
    puts "your guess can only be of 4 digits and between 1-6"
    player_input
  end

  def won(answer,guess)
    if solved?(answer,guess)
      puts "You win\nGame Over"
    else
      puts "You lose\nGame Over"
    end
  end
end