require 'pry'

class BoardCase
  attr_reader :row, :col
  attr_accessor :player, :choiced # in (nil, player1, player2)

  def initialize (row,col)
    @row = row
    @col = col
    @player = 0
    @choiced = false
  end

  def set_choice(num_player)
    if !@choiced
      @player = num_player
      @choiced = true
      return true
    else
      puts "Case déjà choisie ! "
      return false
    end
  end

  def draw
    case @player
    when 1
      return "X"
    when 2
      return "O"
    else
      return "-"
    end
  end

end

class Player

  attr_accessor :name, :num_id

  def initialize(name,num_player)
    @name = name
    @num_id = num_player
  end

end

class Board

  attr_accessor  :b_c # Board Cases

  def initialize
    @b_c = [[],[],[]]
    for i in 0..2
      for j in 0..2
        @b_c[i][j] = BoardCase.new(i,j)
      end
    end
  end

  def draw_cases_played
    for i in 0..2
      line = "|"
      for j in 0..2
        line = line + @b_c[i][j].draw + "|"
      end
      puts line
    end
  end

  def draw_cases_number
    for i in 0..2
      line = "|"
      for j in 0..2
        line = line + (@b_c[i][j].player == 0 ? (i*3 + j ).to_s : " ") + "|"
      end
      puts line
    end
  end


  def select_player_case(player_number,board_case_number)
    i = (board_case_number-1)/3 + 1
    j = board_case_number%3 + 1
    return @b_c[i][j].set_choice(player_number)
  end

  def player_win?(player)

    win = false

    # verify for rows 1,2,3
    win = win || ((@b_c[0][0].player == @b_c[0][1].player) == (@b_c[0][2].player == player))
    win = win || ((@b_c[1][0].player == @b_c[1][1].player) == (@b_c[1][2].player == player))
    win = win || ((@b_c[2][0].player == @b_c[2][1].player) == (@b_c[2][2].player == player))

    # verify for col 1,2,3
    win = win || ((@b_c[0][0].player == @b_c[1][0].player) == (@b_c[2][0].player == player))
    win = win || ((@b_c[0][1].player == @b_c[1][1].player) == (@b_c[2][1].player == player))
    win = win || ((@b_c[0][2].player == @b_c[1][2].player) == (@b_c[2][2].player == player))

    win = win || ((@b_c[0][0].player == @b_c[1][1].player) == (@b_c[2][2].player == player))
    win = win || ((@b_c[0][2].player == @b_c[1][1].player) == (@b_c[2][0].player == player))

    return win

  end

  def convert_num_to_i_j(num_case)
    return num_case/3,num_case%3
  end

end


class Game

  attr_accessor :player

  def initialize

    @player = []

    puts "Entrez le nom du premier joueur"
    @player[1] = Player.new(gets.chomp,1)

    puts "Entrez le nom du deuxieme joueur"
    @player[2] = Player.new(gets.chomp,2)

    @board = Board.new

  end


  def playing
    player_turn = 1
    game_ended = false

    until game_ended

      choice_valided = false

      until choice_valided

        system 'clear'
        puts " Cases déjà jouées :"
        @board.draw_cases_played
        puts ""
        puts " #{@player[player_turn].name}, choisissez une case :"
        @board.draw_cases_number
        puts " Quelle case choisissez-vous ? "
        num_case = gets.chomp.to_i

        (i,j) = @board.convert_num_to_i_j(num_case)
        puts i
        puts j

      end


binding.pry
    end
  end
end

game = Game.new
game.playing


system('cls')

system 'clear'

puts game.player1.name
puts game.player1.num_id

puts game.player2.name
puts game.player2.num_id


# (var == 10 ? “10” : “Not 10”)
