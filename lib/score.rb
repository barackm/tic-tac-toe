require_relative "./game_logic.rb"

class Score
    def get_winner
        @game = GameLogic.new($records)
        winner = false
        @my_results = [@game.rows(), @game.columns(), @game.diagonals()]

        @my_results.each do |result|
            winner = result if result[:condition] == true
        end
        winner
    end

    def get_score
        result = false
        result = $records.all? do |item|
            item.length > 0
        end

        result
    end
end
