require './player.rb'

class Computer < Player
  attr_reader :arrayOfSucess
  def initialize
    @code = codeGenerator
    @arrayOfSucess = [[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0],[0,0,0,0,0,0]]
  end

  def codeGenerator
    code = []
    4.times do
      code.push(rand(6))
    end
    code
  end

  def sucess(pos, num)
    for i in 0..5
      @arrayOfSucess[pos][i] = 1
      if i == num
        @arrayOfSucess[pos][i] = 2
      end
    end
  end
  
  def allFailures?(num)
    for i in 0..3
      retorno = []
      if(@arrayOfSucess[i][num] == 1)
        retorno << false
      end
      if retorno.all?(false)
        return true
      end
    end
    false
  end

  def switchPos(pos, num)
    @arrayOfSucess[pos][num] = 1
    if allFailures?(num)
      return -1
    end
    posibilities = []
    for i in 0..3
      @arrayOfSucess[i].each_with_index do |number,position|
        if number == 0
          posibilities << position
        end
      end
    end
    posibilities.sample
  end

  def failure(num)
    for i in 0..3
      if @arrayOfSucess[i][num] != 2
        @arrayOfSucess[i][num] = 1
      end
    end
  end

  def newTry(pos)
    posibilities = []
    @arrayOfSucess[pos].each_with_index do |element, position| 
      if element == 0  
        posibilities << position
      end
    end
    posibilities.sample.to_s
  end
    
  def randomCodeGuesser(human, guess)
    guessingCode = [0,0,0,0]
    for i in 0..3
      if human.code.include?(guess.split('')[i].to_i)
        if guess.split('')[i] == human.code[i].to_s 
          sucess(i,human.code[i])
          guessingCode[i] = guess.split('')[i]
        else
          newPos = switchPos(i,guess.split('')[i].to_i)
          guessingCode[newPos] = guess.split('')[i]
          if switchPos(newPos,guess.split('')[guess.split('')[newPos].to_i].to_i) == -1 
            guessingCode[i] = newTry(i)
          else
            guessingCode[i] = guess.split('')[guess.split('')[newPos]]
          end
        end
      else
        failure(guess.split('')[i].to_i)
        guessingCode[i] = newTry(i)
      end
    end
    guessingCode.join('')
  end
end
