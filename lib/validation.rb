class Validation
    attr_reader :player_input, :saved_records
    def initialize(player_input, saved_records)
        @player_input = player_input.to_i
        @saved_records = saved_records
    end

    def validate_player_input
        player_input_correct = true
        if @player_input == 0
            player_input_correct = false
        elsif @player_input > @saved_records.length
            player_input_correct = false
        elsif @saved_records[@player_input-1].length > 0
            player_input_correct = false
        else
            player_input_correct = true 
        end
        return player_input_correct
    end
end