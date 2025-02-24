require './player.rb'

class Computer < Player

  def initialize
    @code = codeGenerator
    @posibilities = arrayOfPosibilities
  end

  def codeGenerator
    code = []
    4.times do
      code.push(rand(6))
    end
    code
  end

  def arrayOfPosibilities
    posibilities = []
    (0..5).to_a.repeated_permutation(4) do |code|
      posibilities << code.join
    end
    posibilities
  end

  def stringToArrayOfNums(string)
    retorno = []
    string.split("").each do |digit|
      retorno << digit.to_i
    end
    retorno
  end

  def pegCounter(response, color)
    guess = response.split('')
    counter = 0
    guess.each do |peg|
      if peg == color
        counter += 1
      end
    end
    counter
  end

  def codeFilter(guess, response)
    @code = stringToArrayOfNums(guess)
    codeWhitePegs = pegCounter(response, "⚫")
    codeVoidPegs = pegCounter(response, "◯")
    posibleGuesses = []
    @posibilities.each do |posibility|
      resp = self.guessCheck(posibility)
      whitePegs = pegCounter(resp, "⚫")
      voidPegs = pegCounter(resp, "◯")
      if whitePegs == codeWhitePegs && voidPegs == codeVoidPegs
        posibleGuesses << posibility        
      end
    end
    @posibilities = posibleGuesses
    @posibilities
  end

  def randomCodeGuesser(human, computerGuess)
    newGuess = codeFilter(computerGuess, human.guessCheck(computerGuess))[0]
    newGuess
  end
end

