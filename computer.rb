require './player.rb'

class Computer < Player

  def initialize
    @code = codeGenerator
  end

  def codeGenerator
    code = []
    4.times do
      code.push(rand(6))
    end
    code
  end

  def randomCodeGuesser(human, guess)
    guessingCode = [0,0,0,0]
    for i in 0..3
      if guess.split('')[i] == human.code[i].to_s
        guessingCode[i] = guess.split('')[i]
      else
        guessingCode[i] = rand(6).to_s
      end
    end
    guessingCode.join('')
  end
end