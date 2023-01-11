module Constants
  PLACES = [1, 2, 3, 4, 5, 6, 7, 8, 9].to_a.freeze
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]].to_a.freeze
end

# This class contains all the logic to play tic-tac-toe on the console
class TicTacToe
  include Constants

  def initialize
    initialize_data
    set_player_one
    set_player_two
    draw_initial_board
    until check_winner
      ask_player_turn
      redraw_board
      @counter += 1
    end
    puts "#{(@counter - 1).odd? ? @player_one_name : @player_two_name} wins!!!"
  end

  def initialize_data
    puts "Let's play a simple Tic-Tac-Toe game in the console!\n\nWhat is the name of player #1?"
    @player_one_turns = []
    @player_two_turns = []
    @player_one_name = ''
    @player_one_mark = ''
    @player_two_name = ''
    @player_two_mark = ''
    @counter = 1
  end

  def check_winner
    WIN_COMBINATIONS.any? do |win_combination|
      win_combination.all? do |place|
        @player_one_turns.include?(place)
      end || win_combination.all? do |place|
        @player_two_turns.include?(place)
      end
    end
  end

  def set_player_one
    @player_one_name = gets.chomp
    puts 'What 1 letter (or special character) would you like to be your game marker?'
    @player_one_mark = gets.chomp
  end

  def set_player_two
    puts 'What is the name of player #2?'
    @player_two_name = gets.chomp
    puts 'What 1 letter (or special character) would you like to be your game marker?'
    @player_two_mark = gets.chomp
  end

  def draw_initial_board
    board_map = PLACES.each_with_index.reduce('') do |board, (place, index)|
      if [1, 4, 7].include?(index) then board += " #{place} |"
      elsif [2, 5].include?(index) then board += " #{place} \n      --*---*---\n"
      elsif [0, 3, 6].include?(index) then board += "      #{place} |"
      elsif index == 8 then board += " #{place} \n\n"
      end
      board
    end
    puts board_map
  end

  def ask_player_turn
    player_number = @counter.odd? ? 1 : 2
    p1_condition = player_number == 1 ? @player_one_name : @player_two_name
    p2_condition = player_number == 1 ? @player_one_mark : @player_two_mark
    puts "#{p1_condition}, please enter a number (1-9) that is available to place an '#{p2_condition}'"
    current_turn = gets.chomp
    if player_number == 1 then @player_one_turns.push(current_turn.to_i - 1)
    else
      @player_two_turns.push(current_turn.to_i - 1)
    end
  end

  def draw_section_one(index, place)
    if @player_one_turns.include?(index) then " #{@player_one_mark} |"
    elsif @player_two_turns.include?(index) then " #{@player_two_mark} |"
    else
      " #{place} |" end
  end

  def draw_section_two(index, place)
    if @player_one_turns.include?(index) then " #{@player_one_mark} \n      --*---*---\n"
    elsif @player_two_turns.include?(index) then " #{@player_two_mark} \n      --*---*---\n"
    else
      " #{place} \n      --*---*---\n" end
  end

  def draw_section_three(index, place)
    if @player_one_turns.include?(index) then "      #{@player_one_mark} |"
    elsif @player_two_turns.include?(index) then "      #{@player_two_mark} |"
    else
      "      #{place} |" end
  end

  def draw_section_four(index, place)
    if @player_one_turns.include?(index) then " #{@player_one_mark} \n\n"
    elsif @player_two_turns.include?(index) then " #{@player_two_mark} \n\n"
    else
      " #{place} \n\n" end
  end

  def redraw_board
    board_map = PLACES.each_with_index.reduce('') do |board, (place, index)|
      if [1, 4, 7].include?(index) then board += draw_section_one(index, place)
      elsif [2, 5].include?(index) then board += draw_section_two(index, place)
      elsif [0, 3, 6].include?(index) then board += draw_section_three(index, place)
      elsif index == 8 then board += draw_section_four(index, place) end
      board
    end
    puts board_map
  end
end

TicTacToe.new
