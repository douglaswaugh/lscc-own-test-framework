class Board
    def initialize
        @board = "---------"
    end

    def isEmpty?
        return @board == "---------"
    end

    def place_piece_at(x,y,piece)
        @board[0] = "X"
    end

    def piece_at(x,y)
        return @board[0]
    end
end


class TestFixture
    def initialize

    end

    def run
        self.methods.grep(/test/).each do |method|
            self.send(method.to_sym)
        end
    end

    def set_up
        @board = Board.new
    end

    def test_a_new_board_should_be_empty
        set_up
        assert_equal(@board.isEmpty?, true, "A new board should be empty")
    end

    def test_a_board_should_not_be_empty_after_a_player_has_placed_a_piece
        set_up
        @board.place_piece_at("X",0,0)
        assert_equal(@board.isEmpty?, false, "A board should not be empty after a player has placed a piece")
    end

    def test_after_a_player_has_placed_an_X_at_0_0_the_board_should_have_an_X_X_at_0_0
        set_up
        @board.place_piece_at(0,0,"X")
        assert_equal(@board.piece_at(0,0), "X", "After a player has placed an X at 0,0, the board should have an X and 0,0")
    end

    def assert_equal(actual, expected, test_message)
        if actual != expected
            puts "X " + test_message
            puts "  -> expected #{expected}, but was #{actual}"        
        elsif
            puts "/ " + test_message
        end
    end
end

TestFixture.new.run