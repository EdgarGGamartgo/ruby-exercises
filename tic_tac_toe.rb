# This class contains all the logic to play tic-tac-toe on the console
class TicTacToe
  PLACES = [1, 2, 3, 4, 5, 6, 7, 8, 9].to_a.freeze
  WIN_COMBINATIONS = [[0, 1, 2],
                      [3, 4, 5],
                      [6, 7, 8],
                      [0, 3, 6],
                      [1, 4, 7],
                      [2, 5, 8],
                      [0, 4, 8],
                      [2, 4, 6]].to_a.freeze

  def initialize
    initialize_data
    puts "Let's play a simple Tic-Tac-Toe game in the console!\n\nWhat is the name of player #1?"
    set_player_one
    set_player_two
    draw_initial_board
    ask_player_turn(1)
  end

  def initialize_data
    @player_one_turns = []
    @player_two_turns = []
    @player_one_name = ''
    @player_one_mark = ''
    @player_two_name = ''
    @player_two_mark = ''
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

  def ask_player_turn(player_number)
    p1_condition = player_number == 1 ? @player_one_name : @player_two_name
    p2_condition = player_number == 1 ? @player_one_mark : @player_two_mark

    puts "#{p1_condition}, please enter a number (1-9) that is available to place an '#{p2_condition}'"
    current_turn = gets.chomp
    if player_number == 1 then @player_one_turns.push(current_turn)
    else
      @player_two_turns.push(current_turn)
    end
  end
end

TicTacToe.new

# already_set = false

# board_map_2 = places.each_with_index.reduce('') do |board, (place, index)|
#   if [1, 4, 7].include?(index)
#     my_place = nil
#     if !already_set && index == ore_no_ban.to_i - 1
#       my_place = player_one_marker
#       already_set = true
#     else
#       my_place = place.to_s
#     end
#     board += " #{my_place} |"
#   elsif [2, 5].include?(index)
#     my_place = nil
#     if !already_set && index == ore_no_ban.to_i - 1
#       my_place = player_one_marker
#       already_set = true
#     else
#       my_place = place.to_s
#     end
#     board += " #{my_place} \n      --*---*---\n"
#   elsif [0, 3, 6].include?(index)
#     my_place = nil
#     if !already_set && index == ore_no_ban.to_i - 1
#       my_place = player_one_marker
#       already_set = true
#     else
#       my_place = place.to_s
#     end
#     board += "      #{my_place} |"
#   elsif index == 8
#     my_place = nil
#     if !already_set && index == ore_no_ban.to_i - 1
#       my_place = player_one_marker
#       already_set = true
#     else
#       my_place = place.to_s
#     end
#     board += " #{my_place} \n\n"
#   end
#   board
# end

# puts board_map_2

# # puts '      J | J | J'
# # puts '     ---*---*---'
# # puts '      J | J | J'
# # puts '     ---*---*---'
# # puts "      J | J | J \n\n"
