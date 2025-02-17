class Player

  attr_reader :code
  
  def initialize
    @code = []
  end
  
  def countNumbers(code)
    numberTimes = [0, 0, 0, 0, 0, 0]
    for i in 0..3
      for j in 0..5
        if (code[i] == j)
          numberTimes[j] += 1
        end
      end
    end
    numberTimes
  end
  
  def guessCheck(guess)
    check = ["x","x","x","x"]
    guessNumberTimes = [0, 0, 0, 0, 0, 0]
    for i in 0..3
      if guess.split('')[i].to_i == @code[i]
        check[i] = "⚫"
        guessNumberTimes[guess.split('')[i].to_i] += 1
      end
    end
    for i in 0..3
      if check[i] == "x" && @code.include?(guess.split('')[i].to_i)
        if guessNumberTimes[guess.split('')[i].to_i] < countNumbers(@code)[guess.split('')[i].to_i]
          check[i] = "◯"
        end
        guessNumberTimes[guess.split('')[i].to_i] += 1
      end 
    end
    check.join('') 
  end
    
end