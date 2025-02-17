require './player.rb'

class Human < Player
  def initialize(code)
    codigo = []
    for i in 0..3
      codigo << code.split('')[i].to_i
    end
    @code = codigo
  end
end