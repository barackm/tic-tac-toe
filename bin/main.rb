#!/usr/bin/env ruby
require_relative "../app.rb"

game_cells = ["1","2","3","4","5","6","7","8","9"]

$my_records = Record.new
$score = Score.new

$records = $my_records.get_records

def users_presentation
    puts ""
    puts "🏆--------------------------------------------🏆"
    puts "|     🌼  Welcome to Ruby's Tic-Tac-Toe 🌼     |"
    puts "🏆--------------------------------------------🏆"
    puts ""
    sleep 2
    puts "🤴 Enter Player 1 Name: "
    player_one = gets.chomp
    puts ""
    puts "👸 Enter Player 2 Name: "
    player_two = gets.chomp
    puts ""
    puts "#{player_one.capitalize!} will play with X and #{player_two.capitalize!} will play with O."
    puts ""
    sleep 2
    puts "🔥 💃 Let's start!🕺  🔥"
    puts ""
    puts "Loading..."
    sleep 2
    puts `clear`
    return [player_one, player_two]
end

def user_interface(array)
    puts "     +---+---+---+"
    puts "     | #{array[0]} | #{array[1]} | #{array[2]} |"
    puts "     +---+---+---+"
    puts "     | #{array[3]} | #{array[4]} | #{array[5]} |"
    puts "     +---+---+---+"
    puts "     | #{array[6]} | #{array[7]} | #{array[8]} |"
    puts "     +---+---+---+"
end

$players = users_presentation()

$winner_message = Proc.new do |player|
    puts "🎊  And the Winner is........🎊  "
    sleep 2
    puts ""
    puts "🏆---------------------🏆"
    puts "🎁🎊 🎉 #{player} 🍾 🎊 🎉🎁"
    puts "🏆---------------------🏆"
    puts ""
    puts "🏆 🏆 🏆 🏆 🏆 🏆 🏆 🏆 🏆 🏆 🏆"
    sleep 4
    puts `clear`
end

$game_over_message = Proc.new do
    puts "       💔----- 😥 😥 😥 -----💔"
    puts ""
    puts "            It's a TIE"
    puts "         ❌ Game Over ‼️ ⁉️ ❌"
    puts ""
    puts "       💔----- 😥 😥 😥 -----💔"
end

game_players = Proc.new do |players|
    puts "🏆--------------------------------------------🏆"
    puts "|            🌼  #{players[0]} VS #{players[1]} 🌼           |"
    puts "🏆--------------------------------------------🏆"
    puts ""
end

$player_error_message = Proc.new do |player|
    # game_players.call(players)
    puts ""
    puts "❌ Invalid cell, Choose only available cells in range [1-9]"
    puts ""
    puts "Try again #{player} 💪"
    puts ""
end

def player_prompt(game_cells, game_players, player, player_symb)
    game_players.call($players)
    user_interface(game_cells)
    puts ""
    puts "🎮 It's #{player}'s turn. 👨‍"
    puts ""
    puts "Please select an available cell from the board in the range [1-9]"
    puts ""
    result = gets.chomp

    validate = Validation.new(result, $records)
    user_input_valide = validate.validate_player_input()

    if !user_input_valide 
        loop do
            puts `clear`
            sleep 1
            user_interface(game_cells)
            $player_error_message.call(player)
            result = gets.chomp
            validate = Validation.new(result, $records)
            user_input_valide = validate.validate_player_input()
            break if user_input_valide
        end
    end

    game_cells[result.to_i-1] = player_symb

    $my_records.add_record(result.to_i-1, player_symb)

    puts `clear`
    sleep 1
end


def play_game(game_cells, game_players) 
    loop do
        end_game = $records.all? do |item|
            item.length > 0
        end
    
        player_prompt(game_cells, game_players, $players[0], "X")

        if $score.get_winner()
            player = $score.get_winner()[:player] == "X" ? $players[0] : $players[1] 
            $winner_message.call(player) 
            return
        elsif $score.get_score()
            $game_over_message.call()
            return
        end

        player_prompt(game_cells, game_players, $players[1], "O")
        if $score.get_winner()
            player = $score.get_winner()[:player] == "X" ? $players[0] : $players[1] 
            $winner_message.call(player) 
            return
        elsif $score.get_score()
            $game_over_message.call()
            return
        end
        
        break if end_game
    end
end

play_game(game_cells, game_players,)


