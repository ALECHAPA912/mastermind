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

end