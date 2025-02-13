require './human.rb'
require './computer.rb'

class Board
  
  def initialize
     puts "Bienvenido al Juego Mastermind."
     @computer = Computer.new()
  end
  
  def play
    humanGuessComputer
  end

  def humanGuessComputer
    trials = 12
    while (trials > 0) do
      puts "Ingrese un codigo numerico de 4 digitos (del 0-5)"
      puts "#{trials} intentos restantes!"
      guess = gets.chomp
      trials -= 1
      puts @computer.guessCheck(guess)
      if @computer.guessCheck(guess) == '⚫⚫⚫⚫'
        puts "FELICITACIONES GANASTE EL JUEGO EN #{12-trials} INTENTOS!"
        break
      end
    end
    if @computer.guessCheck(guess) != '⚫⚫⚫⚫' 
      puts "PERDISTE, INTENTALO NUEVAMENTE"
      puts "CODIGO FINAL #{@computer.code}"
    end
  end
  
end