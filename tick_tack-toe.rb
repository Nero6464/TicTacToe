

class TicTac
    attr_accessor :symbol

    def initialize(row,column)
        @row = row
        @column = column
        @symbol = '-'
    end



end

class Player
    attr_reader :symbol

    def initialize(symbol)
        @symbol = symbol
    end

end

board = Array.new(3){Array.new(3)}
player_one = Player.new('o')
player_two = Player.new('x')

def InitializeBoard(arr)

    for i in 0..2
        for j in 0..2
            arr[i][j] = TicTac.new(i,j)
        end
    end
end

def PrintBoard(arr)
    for i in 0..2
        for j in 0..2
            print "#{arr[i][j].symbol} "
        end
        puts "\n"
    end
end

def inRange?(first, last)
    
end

def CheckInput(arr)
    begin    
        input = gets.split(',').map(&:to_i).map {|n| n - 1}
        puts 
    end while(!(input[0].between?(0,2) && input[1].between?(0,2)) || arr[input[0]][input[1]].symbol != '-')
    
end

def PlayGame(arr, play_1, play_2)
    print "Player 1 Goes. Input Row and column: "
    CheckInput(arr)
    arr[input[0]][input[1]].symbol = play_1.symbol

    print "Player 2 Goes. Input Row and column: "
    CheckInput(arr)
    arr[input[0]][input[1]].symbol = play_2.symbol


end

InitializeBoard(board)
PlayGame(board, player_one, player_two)
PrintBoard(board)


