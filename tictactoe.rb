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

    def remplircase(casejouee, sign)
      #La fonction va remplir la case [n-1] correspondant à la case n du tableau
      #La case sera remplie de la forme du joueur ayant invoqué la fonction
      @cases[casejouee-1] = sign.to_s
    end


    def win_cases
        if (@cases[0] == @cases[3] && @cases[3] == @cases[6])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[1] == @cases[4] && @cases[4] == @cases[7])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[2] == @cases[5] && @cases[5] == @cases[8])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[0] == @cases[1] && @cases[1] == @cases[2])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[3] == @cases[4] && @cases[4] == @cases[5])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[6] == @cases[7] && @cases[7] == @cases[8])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[0] == @cases[4] && @cases[4] == @cases[8])== ($player1.sign || $player2.sign)
          return true
        elsif (@cases[2] == @cases[4] && @cases[4] == @cases[6])== ($player1.sign || $player2.sign)
          return true
        else
          return false
        end
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

  attr_accessor :playername , :sign

  def initialize(playername, sign)
    @playername = playername
    @sign = sign
  end

end

# -------- Le jeu ----------------------------------#

class Game

  attr_accessor :casejouee

  def initialize
    p "Commencons la partie!"
    p "Quel est le nom du premier joueur ?"
    playername1 = gets.chomp.to_s
    p "Et son signe ?"
    sign1 = gets.chomp

    #On appelle la création du joueur1
    $player1 = Player.new(playername1, sign1)

    p "Quel est le nom du second joueur ?"
    playername2 = gets.chomp
    p "Et son signe ?"
    sign2 = gets.chomp.to_s

    #On appelle la création du joueur1
    $player2 = Player.new(playername2, sign2)

    p "Les joueurs sont: 'playername1' and 'playername2'."
    @newboard = Board.new  #On initialise un nouveau plateau de jeu
    @tour = 1
    @casedejajouee = []   #On liste ici les cases déjà remplies
    nouveautour           #On lance le premier tour
  end

  def nouveautour
      unless @newboard.win_cases || @tour > 10   #A moins qu'il y ait un vainqueur ou que l'on ait fini de remplir le tableau , on lance un nouveau tour
        if @tour%2 == 1
            p "Au tour de : #{$player1.playername}"
            p "Selectionner une case"
            casejouee = gets.chomp
            if casejouee.match(/[1-9]/)  # Regexp pour limiter les valeurs possibles aux chiffres entre 0 et 9

              if @casedejajouee.include?(casejouee) #Si la case est déjà jouée , cad répértoriée dans la liste des "casedejajouee", alprs on recommence.
                p "Case déjà jouée"
                nouveautour
              else
                @casedejajouee << casejouee #A chaque fois qu'une nouvelle case est jouée, elle est stockée dans la liste casedejajouee
                @newboard.remplircase(casejouee.to_i,$player1.sign)
                @newboard.boardgame
                @tour +=1
                nouveautour
              end

            else
              p "format incorrect"
              nouveautour
            end # Fin test matching 1-9

        else
            p "Au tour de : #{$player2.playername}"
            p "Selectionner une case"
            casejouee = gets.chomp
            if casejouee.match(/[1-9]/)  # Regexp pour limiter les valeurs possibles aux chiffres entre 0 et 9

                if @casedejajouee.include?(casejouee)
                  p "Case déjà jouée"
                  nouveautour
                else
                  @casedejajouee << casejouee
                  @newboard.remplircase(casejouee.to_i,$player2.sign)
                  @newboard.boardgame
                  @tour +=1
                  nouveautour
                end

            else
              p "format incorrect"
              nouveautour
            end # Fin test matching 1-9

        end # Fin Tour
      else
        p "Fin de partie"
      end #Fin unless

  end #Fin nouveautour

end # Fin Class Game

# ------------------------------  Lancement  ----------------------------------#

jeu = Game.new
