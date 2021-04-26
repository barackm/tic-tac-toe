$records = ["","","","","","","","","",]

class GameLogic
    attr_reader :records
    def initialize(records)
        @records = records
    end

    def rows
        array = []
        @records.each_slice(3) do |x,y,z|
            array.push([x,y,z])
        end

        result = { condition: false }
    
        array.each do |row|
            comp = row[0].upcase 
          test = row.all? do |item|
            item.length > 0 && item.upcase == comp
          end
          if test 
            result[:condition] = true
            result[:player] = comp
          end
        end
    
        return result
    end
    
    def columns
        array = []
        @records.each_slice(3) do |x,y,z|
            array.push([x,y,z])
        end
        result = { condition: false }
        my_columns = []
        count = 0
    
        array.each do |item|
            my_array = []
            array.each do |row|
                my_array.push(row[count])
            end
            count +=1
            my_columns.push(my_array)
        end
    
        my_columns.each do |row|
            comp = row[0].upcase 
          test = row.all? do |item|
            item.length > 0 && item.upcase == comp
          end
          if test 
            result[:condition] = true
            result[:player] = comp
          end
        end
    
        result
    end
    
    def diagonals
        array = []
        @records.each_slice(3) do |x,y,z|
            array.push([x,y,z])
        end

        result = { condition: false }
        my_diagonals = []
        forward_count = 0
        reverse_count = array.length - 1
        diagonal_one = []
        diagonal_two = []
    
        array.each do |row|
            diagonal_one.push(row[forward_count])
            diagonal_two.push(row[reverse_count])
            forward_count +=1
            reverse_count -=1
        end
        my_diagonals.push(diagonal_one, diagonal_two)
    
    
        my_diagonals.each do |row|
            comp = row[0].upcase 
          test = row.all? do |item|
             item.length > 0 && item.upcase == comp
          end
          if test 
            result[:condition] = true
            result[:player] = comp
          end
        end
        result
    end
end

class Record
    def get_records
        $records
    end

    def add_record(player_input, player_symb)
        @player_input = player_input
        @player_symb = player_symb

        $records[@player_input] = @player_symb
    end
end

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
