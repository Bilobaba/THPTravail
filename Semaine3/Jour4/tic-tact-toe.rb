
class BoardCase
  attr_reader :row, :col
  attr_accessor :player # in (nil, player1, player2)

  def initialize (row,col)
    @row = row
    @col = col
    @player = 0
  end

  def set_choice(num_player)
    if @player == 0
      @player = num_player
      return true
    else
      puts "Case déjà choisie ! "
      return false
    end
  end

  def draw
    case @choice
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
  @@count = 0

  def initialize(name)
    @name = name
    @num_id = (@@count += 1)
  end

end

class Board

  attr_accessor  :b_c # Board Cases

  def initialize
    b_c = [][]
    for i in 1..3
      for j in 1..3
        b_c[i][j] = BoardCase.new
      end
    end
  end

  def draw
    put "|" b_c[1][1].draw,"|" b_c[1][2].draw,"|" b_c[1][3].draw,"|"
    put "|" b_c[2][1].draw,"|" b_c[2][2].draw,"|" b_c[2][3].draw,"|"
    put "|" b_c[3][1].draw,"|" b_c[3][2].draw,"|" b_c[3][3].draw,"|"
  end

  def select_player_case(player_number,board_case_number)
    i = (board_case_number-1)/3 + 1
    j = board_case_number%3 + 1
    return b_c[i][j].set_choice(player_number)
  end

  def player_win?(player)

    win = false

    # verify for rows 1,2,3
    win = win || (b_c[1][1].player == b_c[1][2].player == b_c[1][3].player == player)
    win = win || (b_c[2][1].player == b_c[2][2].player == b_c[2][3].player == player)
    win = win || (b_c[3][1].player == b_c[3][2].player == b_c[3][3].player == player)

    # verify for col 1,2,3
    win = win || (b_c[1][1].player == b_c[2][1].player == b_c[3][1].player == player)
    win = win || (b_c[1][2].player == b_c[2][2].player == b_c[3][2].player == player)
    win = win || (b_c[1][3].player == b_c[2][3].player == b_c[3][3].player == player)

    win = win || (b_c[1][1].player == b_c[2][2].player == b_c[3][3].player == player)
    win = win || (b_c[1][3].player == b_c[2][2].player == b_c[3][1].player == player)

    return win

  end
end


class Game

end

 # binding.pry

 # binding.pry

 # binding.pry
