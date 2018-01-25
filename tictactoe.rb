# --------Plateau de jeu ----------------------------------#
class Board
    attr_accessor :casesdisponibles

    def initialize
      @cases = []
      @cases << 9.times {BoardCase.new(value)}
      p boardgame
    end

    def boardgame
        puts "#{@cases[0].value} | #{@cases[1].value} | #{@cases[2].value}"
        puts "-----------"
        puts "#{@cases[3].value} | #{@cases[4].value} | #{@cases[5].value}"
        puts "-----------"
        puts "#{@cases[6].value} | #{@cases[1].value} | #{@cases[8].value}"
    end


end

# --------Boardcase ----------------------------------#

class BoardCase
    attr_accessor :value, :numbercase

    def initialize(value=" ")
      @value = value
    end

    def returnstatus
      p "La case #{@numbercase} est #{@status}."
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
    p "Les deux joueurs sont : #{$player1} et #{$player2}."
    Board.new
    @tour = 1
  end

  def nouveautour
    if @tour%2 == 1
      p "Tour du joueur #{$player1}"
      p "Selectionner une case"
      @casejouee = gets.to_i
        p $casesdisponibles
        if $casesdisponibles.include?(@casejouee)
          return casejouee
        else
          p "Case déjà jouée"
        end
    else
      p "Tour du joueur #{$player2},  symbole : O "
    end
  end

end

# ------------------------------  Lancement  ----------------------------------#


jeu = Game.new
