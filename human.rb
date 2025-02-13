require './player.rb'

class Human < Player
  
  def initialize(code)
    @code = code.split('')
  end

end