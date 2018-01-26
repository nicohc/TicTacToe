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

    def remplircase(casejouee, form)
      #La fonction va remplir la case [n-1] correspondant à la case n du tableau
      #La case sera remplie de la forme du joueur ayant invoqué la fonction
      @cases[casejouee-1] = form.to_s
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
      return @value.to_s    # Renvoie la valeur au format string
    end
end

# -------- Player ----------------------------------#
class Player

  attr_accessor :player1 , :player2 , :player1status, :player2status, :casespossedees1 , :casespossedees2

  def initialize
    p "What's the name of the first player ?"
    $player1 = gets.chomp   #On insere le nom du premier joueur
    @form = "X"             #On détermine la forme qui le représente
    p "You are the 'X' ! "
    $player1winner = false
    @casespossedees1 = []
    print "\n"

    p "What's the name of the second player ?"
    $player2 = gets.chomp
    @form = "O"
    p "You are the 'O' ! "
    @casespossedees2 = []
    $player2winner = false
  end

end

# -------- Le jeu ----------------------------------#

class Game

  attr_accessor :casejouee

  def initialize
    p "Hello, let's begin !"

    #On appelle la création des joueurs
    Player.new
    p "The players are : #{$player1} and #{$player2}."
    @newboard = Board.new
    @tour = 1
    @casedejajouee = []
    nouveautour
  end

  def nouveautour
      unless ($player1winner || $player2status)
        if @tour%2 == 1
            p "Player's turn : #{$player1}"
            p "Select one case"
            casejouee = gets.chomp
            if casejouee.match(/[1-9]/)  # Regexp pour limiter les valeurs possibles aux chiffres entre 0 et 9

              if @casedejajouee.include?(casejouee)
                p "Case déjà jouée"
                nouveautour
              else
                @casedejajouee << casejouee
                @newboard.remplircase(casejouee.to_i,"X")
                @newboard.boardgame
                @tour +=1
                nouveautour
              end

            else
              p "format incorrect"
              nouveautour
            end # Fin test matching 1-9

        else
            p "Player's turn : #{$player2}"
            p "Select one case"
            casejouee = gets.chomp
            if casejouee.match(/[1-9]/)  # Regexp pour limiter les valeurs possibles aux chiffres entre 0 et 9

                if @casedejajouee.include?(casejouee)
                  p "Case déjà jouée"
                  nouveautour
                else
                  @casedejajouee << casejouee
                  @newboard.remplircase(casejouee.to_i,"O")
                  @newboard.boardgame
                  @tour +=1
                  nouveautour
                end

            else
              p "format incorrect"
              nouveautour
            end # Fin test matching 1-9

        end # Fin Tour
      end #Fin unless
  end #Fin nouveautour

end   # Fin Class Game

# ------------------------------  Lancement  ----------------------------------#

jeu = Game.new
