require_relative "game.rb"

def play_again
  puts "Wanna play again?(y/n)"
  re_play = gets.chomp!
  if re_play.eql? "y"
    Game.new.play
    play_again
  end
end

Game.new.play
play_again
