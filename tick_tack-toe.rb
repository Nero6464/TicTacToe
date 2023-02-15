

class TicTac
    attr_accessor :symbol
    @diagonal = [[[0,0],[1,1],[2,2]], [[0,2],[1,1],[2,0]]]
    class << self
        attr_reader :diagonal
    end

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


def GetInput(matrix, player)
    begin
        print "Enter coordinate: "    
        input = gets.split(',').map(&:to_i).map {|n| n - 1}
    end while(!(input[0].between?(0,2) && input[1].between?(0,2)) || matrix[input[0]][input[1]].symbol != '-')
    matrix[input[0]][input[1]].symbol = player.symbol
    return input
end

def PlayGame(matrix, play_1, play_2)
    
    continue_game = "yes"
    while continue_game != "no"
        winner1 = false
        winner2 = false
        while winner1 == false && winner2 ==false
            print "Player 1 Goes. Input Row and column: "
            input = GetInput(matrix, play_1)
            if CheckWinner(matrix,input)
                puts "Player 1 Wins!"
                PrintBoard(matrix)
                break
            end
            PrintBoard(matrix)

            print "Player 2 Goes. Input Row and column: "
            input = GetInput(matrix, play_2)
            if CheckWinner(matrix,input) 
                puts "Player 2 Wins!"
                PrintBoard(matrix)
                break
            end
            PrintBoard(matrix)
        end

        print "Continue Game?"
        continue_game = gets.chomp
        print continue_game
    end
end



def CheckWinner(matrix,input)
    tmp = Array.new()

    #Check Diagonals
    if (TicTac.diagonal[0].include?(input))
        for i in 0..2
            tmp.push(matrix[TicTac.diagonal[0][i][0]][TicTac.diagonal[0][i][1]].symbol)
        end
        if tmp.uniq.length == 1
            return true
        end
    end

    tmp = Array.new()

    if (TicTac.diagonal[1].include?(input))
        for i in 0..2
            tmp.push(matrix[TicTac.diagonal[1][i][0]][TicTac.diagonal[1][i][1]].symbol)
        end
        if tmp.uniq.length == 1
            return true
        end
    end

    tmp = Array.new()

    #Check row
    for i in 0..2
        tmp.push(matrix[input[0]][i].symbol)
    end

    if tmp.uniq.length == 1
        return true
    end

    tmp = Array.new()
    
    #Check column
    for j in 0..2
        tmp.push(matrix[j][input[1]].symbol)
    end

    if tmp.uniq.length == 1
        return true
    end

    return false

end
InitializeBoard(board)
PlayGame(board, player_one, player_two)



