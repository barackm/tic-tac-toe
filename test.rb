my_array = ["1","2","3","4","5","6","7","8","9",]
my_result = ["","","","","","","","","",]

players = ""

def user_interface(array)
    puts "     +---+---+---+"
    puts "     | #{array[0]} | #{array[1]} | #{array[2]} |"
    puts "     +---+---+---+"
    puts "     | #{array[3]} | #{array[4]} | #{array[5]} |"
    puts "     +---+---+---+"
    puts "     | #{array[6]} | #{array[7]} | #{array[8]} |"
    puts "     +---+---+---+"
end


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


winner_message = Proc.new do |player|
    puts "🎊  And the Winner is........🎊  "
    sleep 2
    puts ""
    puts "🏆---------------------🏆"
    puts "🎁🎊 🎉 #{player} 🍾 🎊 🎉🎁"
    puts "🏆---------------------🏆"
    sleep 2
    puts `clear`
end


game_over_message = Proc.new do
    puts "💔----- 😥 😥 😥 -----💔"
    puts ""
    puts "It's a TIE"
    puts "❌ Game Over ‼️ ⁉️ ❌"
    puts ""
    puts "💔----- 😥 😥 😥 -----💔"
end

game_players = Proc.new do |players|
    puts "🏆--------------------------------------------🏆"
    puts "|            🌼  #{players[0]} VS #{players[1]} 🌼           |"
    puts "🏆--------------------------------------------🏆"
    puts ""
end

players = users_presentation()

player_error_message = Proc.new do |player, game_players |
    # game_players.call(players)
    puts ""
    puts "❌ Invalid cell, Choose only available cells in range [1-9]"
    puts ""
    puts "Try again #{player} 💪"
    puts ""
end


def condition(input, my_result)
    correct_input = true
    input = input.to_i
    if input.to_i == 0
        correct_input = false
    elsif input > my_result.length
        correct_input = false
    elsif my_result[input-1].length > 0
        correct_input = false
    else
        correct_input = true 
    end
    return correct_input
end




def player_one_prompt(my_array, players, my_result, player_error_message, game_players)
    game_players.call(players, game_players)
    user_interface(my_array)
    puts ""
    puts "🎮 It's #{players[0]}'s turn. 👨‍"
    puts ""
    puts "Please select an available cell from the board in the range [1-9]"
    puts ""
    result = gets.chomp
    if !condition(result, my_result) 
        loop do
            puts `clear`
            sleep 1
            user_interface(my_array)
            player_error_message.call(players[0])
            result = gets.chomp
            condition = condition(result, my_result)
            break if condition
        end
    end
    my_result[result.to_i-1] = "X"
    my_array[result.to_i-1] = "X"

    puts `clear`
    sleep 1
end

def player_two_prompt(my_array, players, my_result,player_error_message, game_players)
    game_players.call(players, game_players)
    user_interface(my_array)

    puts ""
    puts "🎮 It's #{players[1]}'s turn. 👨‍"
    puts ""
    puts "Please select an available cell from the board in the range [1-9]"
    result = gets.chomp
    if !condition(result, my_result) 
        loop do
            puts `clear`
            sleep 1
            user_interface(my_array)
            player_error_message.call(players[0])
            result = gets.chomp
            condition = condition(result, my_result)
            break if condition
        end
    end
    my_result[result.to_i-1] = "O"
    my_array[result.to_i-1] = "O"

    puts `clear`
    sleep 1
end



def play_game(my_array, players, my_result, player_error_message, game_players) 
    loop do
        end_game = my_result.all? do |item|
            item.length > 0
        end
    
        player_one_prompt(my_array, players, my_result, player_error_message, game_players)
        player_two_prompt(my_array, players, my_result, player_error_message, game_players)
        
        break if end_game
    end

end

    


play_game(my_array, players, my_result, player_error_message, game_players)


