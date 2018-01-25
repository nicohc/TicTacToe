# --------Plateau de jeu ----------------------------------#
class Board
    attr_accessor :cases

    def initialize
      @cases = []
      @cases << 9.times {BoardCase.new("vide")}
      boardgame
    end

    def boardgame
        puts "| #{@cases[0].to_s} | #{@cases[1]} | #{@cases[2]} |"
        puts "-----------"
        puts "| #{@cases[3].to_s} | #{@cases[4]} | #{@cases[5]} |"
        puts "-----------"
        puts "| #{@cases[6].to_s} | #{@cases[1]} | #{@cases[8]} |"
    end

end

# -------- Cases du jeu ----------------------------------#
class BoardCase
    attr_accessor :value, :number
    @@count = 0
    def initialize(value)
      @value = value
      @number = @@count + 1
      @@count += 1
    end
    def to_s
      # Renvoie la valeur au format string
      return @value.to_s
    end
end

# -------- Player ----------------------------------#
class Player

  attr_accessor :player1 , :player2 , :casespossedees1 , :casespossedees2

  def initialize
    p "What's the name of the first player ?"
    $player1 = gets.chomp
    @form = "X"
    p "You are the 'X' ! "
    @casespossedees1 = []
    p "What's the name of the second player ?"
    $player2 = gets.chomp
    @form = "O"
    p "You are the 'O' ! "
    @casespossedees2 = []
  end

  def player1tour(casejouee)
    @casespossedees1 << casejouee
    p "vous possedez les cases : #{@casespossedees1}"

    # $player1.choix
  end

end

# -------- Le jeu ----------------------------------#

class Game

  attr_accessor :casejouee

  def initialize
    p "Hello, let's begin !"
    Player.new
    p "The players are : #{$player1} and #{$player2}."
    Board.new
    @tour = 1
  end

  def nouveautour
    if @tour%2 == 1
      p "Player's turn : #{$player1}"
      p "Select one case"
      @casejouee = gets.to_i
        p $casesdisponibles
        if $casesdisponibles.include?(@casejouee)
          return casejouee
        else
          p "Case déjà jouée"
        end
    else
      p "Player's turn : #{$player2} "
    end
  end

end

# ------------------------------  Lancement  ----------------------------------#


jeu = Game.new
