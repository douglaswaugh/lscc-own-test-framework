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
        self.methods.grep(/test_/).each do |method|
            set_up
            self.send(method, method.to_s)
        end
    end

    def set_up
        @board = Board.new
    end

    def test_a_new_board_should_be_empty(message)
        assert_equal(@board.isEmpty?, true, format_test_name(message))
    end

    def test_a_board_should_not_be_empty_after_a_player_has_placed_a_piece(message)
        @board.place_piece_at("X",0,0)
        assert_equal(@board.isEmpty?, false, format_test_name(message))
    end

    def test_after_a_player_has_placed_an_X_at_0_0_the_board_should_have_an_X_X_at_0_0(message)
        @board.place_piece_at(0,0,"X")
        assert_equal(@board.piece_at(0,0), "X", format_test_name(message))
    end

    def assert_equal(actual, expected, test_message)
        if actual != expected
            puts "X " + test_message
            puts "  -> expected #{expected}, but was #{actual}"        
        elsif
            puts "/ " + test_message
        end
    end

    def format_test_name(message)
        message_with_underscores = message.gsub!("_", " ")
        message_without_test = message_with_underscores.sub(/test /, "")
        return message_without_test.capitalize
    end
end

TestFixture.new.run