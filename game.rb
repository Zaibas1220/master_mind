require_relative "player.rb"
require_relative "computer.rb"

class Game

  def play 
    display
    game_mode = mode_input
    code_maker if game_mode == "1"
    code_breaker if game_mode =="2"
  end


  def mode_input
    puts "Select the mode"
    input = gets.chomp!
    return input if input.match(/^[1-2]$/)
    puts "Invalid Input"
    mode_input
  end

  def code_maker
    CodeMaker.new.play
  end

  def code_breaker
    puts `clear`
    puts "You have chosen Code Maker, Please enter your first guess"
    CodeBreaker.new.play
  end

  def display
  puts "Welcome to Mastermind\n
      Please select your choice\n
      1. Code Maker: - you make a code and computer guesses it\n
      2. Code Breaker: - computer randomly selects a code and you try to break it.\n
      __________\n
      Clues:\n
      X: - Right Number at the Wrong Position\n
      O: - Right Number at the Right Position\n
      __________\n"
  end

end