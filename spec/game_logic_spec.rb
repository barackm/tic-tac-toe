require_relative "../lib/game_logic.rb"


describe GameLogic do
    describe "#rows" do
      it "Should return {condition: true, player: \"X\"} if at least one row array has the same elements" do
        records = ["X","X","X","","","","","",""]
        calculator = GameLogic.new(records)
        expect(calculator.rows()).to eql({condition: true, player: "X"})
      end

      it "Should return false if any row array has the same elements" do 
        records = ["X","O","X","","","","","",""]
        calculator = GameLogic.new(records)
        expect(calculator.rows()).to eql({condition: false})
      end
    end

    describe "#columns" do 
      it "Should return {condition: true, player: \"O\"} if at least one column array has the same elements" do 
        records = ["O","","","O","","","O","",""]
        calculator = GameLogic.new(records)
        expect(calculator.columns()).to eql({condition: true, player: "O"})
      end

      it "Should return {condition: false} if any columns array has the same elements" do 
        records = ["0","","","X","","","0","",""]
        calculator = GameLogic.new(records)
        expect(calculator.columns()).to eql({condition: false})
      end
    end

    describe "#diagonals" do
      it "Should return {condition: true, player: \"O\"} if at least one diagonal array has the same elements" do 
        records = ["O","","","","O","","","","O"]
        calculator = GameLogic.new(records)
        expect(calculator.diagonals()).to eql({condition: true, player: "O"})
      end

      it "Should return {condition: false} if any one diagonal array has the same elements" do 
        records = ["0","","","","X","","","","0"]
        calculator = GameLogic.new(records)
        expect(calculator.diagonals()).to eql({condition: false})
      end
    end
end