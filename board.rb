require './human.rb'
require './computer.rb'

class Board
  
  def initialize
     puts "Bienvenido al Juego Mastermind."
     @computer = Computer.new()
  end
  
  def play
    puts "Presione '1': si desea adivinar el codigo secreto aleatorio"
    puts "Presione '2': si desea ingresar un codigo secreto y que la computadora intente adivinarlo"
    choice = gets.chomp
    while choice != "1" && choice != "2"
      puts "Por favor seleccione una opcion valida ('1' o '2')"
      choice = gets.chomp
    end
    if choice == "1"
    humanGuessComputer
    elsif choice == "2" 
      computerGuessHuman
    end
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

  def computerGuessHuman
    trials = 12
    puts "Ingrese un codigo numerico de 4 digitos (del 0-5)"
    human = Human.new(gets.chomp)
    computerGuess = @computer.code.join('')
    puts computerGuess
    puts human.guessCheck(computerGuess)
    trials -= 1
    while (trials > 0 && human.guessCheck(computerGuess) != '⚫⚫⚫⚫') do
      computerGuess = @computer.randomCodeGuesser(human, computerGuess)
      puts computerGuess
      puts human.guessCheck(computerGuess)
      trials -= 1
    end
    if (human.guessCheck(computerGuess) == '⚫⚫⚫⚫')
      puts "LA MAQUINA ADIVINO EL CODIGO EN #{12 - trials} INTENTOS"
    else
      puts "LA MAQUINO NO PUDO ADIVINAR EL CODIGO DENTRO DE LOS 12 INTENTOS"
    end
  end
end