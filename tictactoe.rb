# --------Plateau de jeu ----------------------------------#
class Board
    attr_accessor :cases

    def initialize
      #On crée le tableau de jeu sous forme d'une matrice de 9 cases.
      # cf. http://ruby-doc.org/core-2.5.0/Array.html
      # On crée 9 cases à partir de la classe Boardcase, et prenant comme valeur initiale " "
      @cases = Array.new(9, BoardCase.new("_"))

      #On appelle la fonction boardgame
      boardgame
    end

    def boardgame
      #La fonction boardgame affiche le plateau de jeu
        print "\n"
        puts "-------------"
        puts "| #{@cases[0]} | #{@cases[1]} | #{@cases[2]} |"
        puts "-------------"
        puts "| #{@cases[3]} | #{@cases[4]} | #{@cases[5]} |"
        puts "-------------"
        puts "| #{@cases[6]} | #{@cases[7]} | #{@cases[8]} |"
        puts "-------------"
        print "\n"
    end

end

# -------- Cases du jeu ----------------------------------#
class BoardCase
    attr_accessor :value, :number
    @@count = 0
    def initialize(value)
      @value = value.to_s
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
    print "\n"
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
