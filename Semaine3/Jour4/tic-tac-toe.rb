require 'pry'

Draw_sym = ["X","O","-"]

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
    if (0 <= board_case_number) && (board_case_number <= 8)
      return @b_c[i][j].set_choice(player_number)
    else
      puts "Veuillez saisir un nombre entre 0 et 8"
      return false
    end
  end

  def player_win?(player)

    win = false

    # verify for rows 1,2,3
    rows = [true,true,true]
    cols = [true,true,true]
    diag1 = true
    diag2 = true

    for i in 0..2
      for j in 0..2
        rows[i] = rows[i] && (@b_c[i][j].player == player )
        cols[j] = cols[j] && (@b_c[i][j].player == player )
      end
    end

    diag1 = diag1 && (@b_c[0][0].player == player)
    diag1 = diag1 && (@b_c[1][1].player == player)
    diag1 = diag1 && (@b_c[2][2].player == player)

    diag2 = diag2 && (@b_c[0][2].player == player)
    diag2 = diag2 && (@b_c[1][1].player == player)
    diag2 = diag2 && (@b_c[2][0].player == player)

    for k in 0..2
      win = win || (rows[k] || cols[k])
    end

    win = (win || diag1) || diag2

    return win
  end

  def end_game

    full_board = true
    for i in 0..2
      for j in 0..2
        full_board = full_board && b_c[i][j].choiced
      end
    end

    end_game = (player_win?(1) || player_win?(2)) || full_board

#binding.pry
  end

  def convert_num_to_i_j(num_case)
    return num_case/3,num_case%3
  end

end


class Player

  attr_accessor :name, :num_id

  def initialize(name,num_player)
    @name = name
    @num_id = num_player
  end

  def play(board)

    choice_valided = false

#binding.pry

    until choice_valided
      system 'clear'
      puts " Cases déjà jouées :"
      board.draw_cases_played
      puts ""
      puts " #{@name}, choisissez une case #{Draw_sym[@num_id-1]}:"
#binding.pry
      board.draw_cases_number
      puts " Quelle case choisissez-vous ? "
      num_case = gets.chomp.to_i

      (i,j) = board.convert_num_to_i_j(num_case)
      puts i
      puts j
      choice_valided = board.b_c[i][j].set_choice(@num_id)

#binding.pry
    end

    return board
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

#binding.pry

      @board = @player[player_turn].play(@board)

#binding.pry

      game_ended = @board.end_game

#binding.pry

      if game_ended && @board.player_win?(player_turn)
        puts "Bravo #{@player[player_turn].name}, vous avez gagné !"
#binding.pry
        return
      elsif game_ended
        puts "Vous avez tous les deux bien joué, personne n a gagné."
        return
#binding.pry

      end

      player_turn += 1

      player_turn = (player_turn % 2 == 0 ? 2 : 1 )
#binding.pry

    end
  end
end

game = Game.new
game.playing







# (var == 10 ? “10” : “Not 10”)
