require_relative 'prompt'
require 'byebug'
class Game

  attr_accessor :streak, :answer, :choice
  attr_reader :turn

  def initialize(turns = 20)
    raise "Argument must be an integer!" unless turns.is_a?(Integer)
    @turns = turns
    @streak = 0
    @choice = nil
    @answer = nil
  end

  QUESTION_NUMBERS = (1..20).to_a

  def jumble_question_numbers
    QUESTION_NUMBERS.shuffle
  end

  def play
    # debugger
    instructions
    num = 1
    questions = jumble_question_numbers
    until over?
      num = 1 if num == 20
      display_question(questions[num])
      get_choice
      @choice == "i" ? instructions : keep_score
      num += 1
      sleep(3)
    end

    game_over
  end

  def keep_score
    if @answer == @choice
      @streak += 1
      puts "CORRECT... current streak is #{@streak}."
      2.times{Prompt.assbar}
    else
      @streak = 0
      puts "WRONG...streak = 0!"
      puts "...the correct answer was #{@answer}."
      puts "Keep studying, you can do this."
      2.times{Prompt.assbar}
    end
  end

  def display_question(num)
    if num.between?(1, 8)
      @answer = "a"
    elsif num.between?(9, 14)
      @answer = "b"
    elsif num.between?(15, 17)
      @answer = "c"
    elsif num.between?(18, 20)
      @answer = "d"
    end
    Prompt.send("question#{num}".to_sym)
  end

  def get_choice
    choices = %w{a b c d i}
    @choice = gets.chomp.downcase
    raise "Invalid answer choice..." unless choices.include?(choice)
  end

  def over?
    @turns == @streak
  end

  def game_over
    8.times do
      Prompt.assbar
    end
    puts "Nice job...hopefully it sticks."
  end

  def instructions
    puts "Welcome to Nick's Authentication Software System"
    puts "The default streak required to stop this program is 20..."
    puts "@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$"
    puts "Enter the letter that corresponds to your answer choice,"
    puts "followed by the return key. If you get something wrong, this"
    puts "program will let you know, and your streak will be reset to zero."
    puts "@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$@$$"
    puts "Good luck, and thank you for using Nick's Authentication Software System."
    puts "Press 'i' at any time to receive these instructions again."
    2.times do
      Prompt.assbar
    end
  end

end

if __FILE__ == $PROGRAM_NAME
  game = Game.new
  game.play
end
