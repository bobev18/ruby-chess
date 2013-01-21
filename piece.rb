#piece.rb


class Piece
    attr_accessor :color, :type, :square, :x, :y
    CAPTURE_SIGN = 'x'

    def initialize(color, type, square, debug=nil)
        # color=['w','b'];  type=['p','r','n','b','q','k']; sq = [a1..h8]
        @color = color
        @type = type
        @square = square
        @x = @square[0].ord-96
        @y = @square[1].to_i
        @debug = debug
    end

    def to_s
        @color + @type + '@' + @square
    end

    def debug(command = '', level = 1)
        if @debug
            if command != ''
                exec(command)
            else
                p '@color', @color
                p '@type', @type
                p '@square', @square
                p '@x, @y', @x, @y
                p 'debug level', level
            end
        end
    end

    def p2s(dx,dy)
        # returns square designation given coordinates
        # allows for invalid conversion, which need to be filtered out at the end
        (96 + @x + dx).chr + (@y + dy).to_s
    end
end

class Pawn < Piece
    attr_accessor :color, :square, :x, :y

    def initialize(color, square)
        @color = color
        @square = square
        @x = @square[0].ord-96
        @y = @square[1].to_i
    end

    def move(board_state)
        result = []
        if @color == 'w' then direction = 1 else direction = -1 end
        if (@y == 2 or @y == 7) and not board_state[p2s(0, 1 * direction)] and not board_state[p2s(0, 2 * direction)]
            result << {action:'m', from: @square, to: p2s(0, 1 * direction), notation: p2s(0, 1 * direction)}
            result << {action:'m', from: @square, to: p2s(0, 2 * direction), notation: p2s(0, 2 * direction)}
        end
        # the above might end outside of the board, which can be filtered later
        dispalacement = p2s(0, 1*direction)
        if @y>2 and @y<7 and not board_state[displacement] then result << {action:'m', from: @square, to: displacement, notation: displacement} end
        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end

    def promote(board_state)
        result = []
        if @color == 'w' and @y==7
            if not board_state[p2s(0,1)]
                result += ['R','N','B','Q'].collect { |promo| {action: 'p', from: @square, to: p2s(0,1), notation: p2s(0,1) + promo} }
            elsif board_state[p2s(1,1)] and board_state[p2s(1,1)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(1,1), notation: p2s(1,1) + promo} }
            elsif board_state[p2s(-1,1)] and board_state[p2s(-1,1)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(-1,1), notation: p2s(-1,1) + promo} }
            end
        elsif @color == 'b' and @y==2
            if not board_state[p2s(0,-1)]
                result += ['R','N','B','Q'].collect { |promo| {action: 'p', from: @square, to: p2s(0,-1), notation: p2s(0,-1) + promo} }
            elsif board_state[p2s(1,-1)] and board_state[p2s(1,-1)][0]=='w'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(1,-1), notation: p2s(1,-1) + promo} }
            elsif board_state[p2s(-1,-1)] and board_state[p2s(-1,-1)][0]=='w'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(-1,-1), notation: p2s(-1,-1) + promo} }
            end
        end
        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end

    def take(board_state)
        result = []
        if @color == 'w'
            # captures left
            displacement = p2s(-1, 1)
            if @y>=2 and @y<7 and board_state[displacement] and board_state[displacement][0]=='b'
                result << { action: 't', from: @square, to: displacement, notation: @square[0] + CAPTURE_SIGN + displacement }
            end
            if @y==5 and not board_state[displacement] and board_state[p2s(-1,0)]=='bp' then result << {action: 'e', from: @square, tp: displacement, notation: @square[0] + CAPTURE_SIGN + displacement} end
            # captures right
            displacement = p2s(1, 1)
            if @y>=2 and @y<7 and board_state[displacement] and board_state[displacement][0]=='b'
                result << { action: 't', from: @square, to: displacement, notation: @square[0] + CAPTURE_SIGN + displacement}
            end
            if @y==5 and not board_state[displacement] and board_state[p2s(1,0)]=='bp' then result << {action: 'e', from: @square, tp: displacement, notation: @square[0] + CAPTURE_SIGN + displacement} end
        else
            displacement = p2s(-1, -1)
            if @y<=7 and @y>2 and board_state[displacement] and board_state[displacement][0]=='w'
                result << { action: 't', from: @square, to: displacement, notation: @square[0] + CAPTURE_SIGN + displacement}
            end
            if @y==4 and not board_state[displacement] and board_state[p2s(-1,0)]=='wp' then result << {action: 'e', from: @square, tp: displacement, notation: @square[0] + CAPTURE_SIGN + displacement} end
            # captures right
            displacement = p2s(1, -1)
            if @y<=7 and @y>2 and board_state[displacement] and board_state[displacement][0]=='w'
                result << { action: 't', from: @square, to: displacement, notation: @square[0] + CAPTURE_SIGN + displacement}
            end
            if @y==4 and not board_state[displacement] and board_state[p2s(1,0)]=='wp' then result << {action: 'e', from: @square, tp: displacement, notation: @square[0] + CAPTURE_SIGN + displacement} end
        end
        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end

    def expand(board_state)
        move(board_state) + promote(board_state) + take(board_state)
    end
end

class Knight < Piece
    attr_accessor :color, :square, :x, :y

    def initialize(color, square)
        @color = color
        @square = square
        @x = @square[0].ord-96
        @y = @square[1].to_i
    end

    def expand(board_state)
        result = []
        [@x+1, @y-2, @x+2, @y-1, @x+2, @y+1, @x+1, @y+2, @x-1, @y-2, @x-2, @y-1, @x-2, @y+1, @x-1, @y+2].each do |x,y|
            if not board_state[p2s(x,y)]
                result << {action: 'm', from: @square, to: p2s(x,y), notation: 'N'+p2s(x,y)}
            else
                if board_state[p2s(x,y)][0] != @color then result << {action: 't', from: @square, to: p2s(x,y), notation: 'Nx'+p2s(x,y)} end
            end
        end
        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end
end

class Other < Piece
    attr_accessor :color, :type, :square, :x, :y

    def initialize(color, type, square)
        @color = color
        @square = square
        @type = type
        @x = @square[0].ord-96
        @y = @square[1].to_i
    end

    def expand(board_state)
        result = []
        if @type == 'k'
            maxrange = 2
        else
            maxrange = 8
        end

        directions = [
            {name: 'NE', flag: false, types: ['q','b','k'], displacement: [ 1, 1 ]},
            {name: 'E' , flag: false, types: ['q','r','k'], displacement: [ 1, 0 ]},
            {name: 'SE', flag: false, types: ['q','b','k'], displacement: [ 1, -1]},
            {name: 'S' , flag: false, types: ['q','r','k'], displacement: [ 0, -1]},
            {name: 'SW', flag: false, types: ['q','b','k'], displacement: [-1, -1]},
            {name: 'W' , flag: false, types: ['q','r','k'], displacement: [-1, 0 ]},
            {name: 'NW', flag: false, types: ['q','b','k'], displacement: [-1, 1 ]},
            {name: 'N' , flag: false, types: ['q','r','k'], displacement: [ 0, 1 ]},
        ]

        1.up_to maxrange do |i|
            directions.each do |direction|
                if not direction[:flag] and direction[:types].include? @type
                    if not board_state[p2s(i*direction[:displacement])]
                        result << {action: 'm', from: @square, to: p2s(displacement), notation: @type.upper + p2s(displacement)}
                    else
                        result << {action: 't', from: @square, to: p2s(displacement), notation: @type.upper + CAPTURE_SIGN + p2s(displacement)}
                    end
                end
            end
        end

        if @type == 'k'
            if @color == 'w' and @square == 'e1' and board_state['h1']=='wr' and not board_state['f1'] and not board_state['g1'] then result << {action: 'c', from: @square, to: p2s(2,0), notation: 'O-O'} end
            if @color == 'b' and self.sq == 'e8' and board_state['h8']=='br' and not board_state['f8'] and not board_state['g8'] then result << {action: 'c', from: @square, to: p2s(2,0), notation: 'O-O'} end
            if @color == 'w' and self.sq == 'e1' and board_state['a1']=='wr' and not board_state['b1'] and not board_state['c1'] and not board_state['d1']
                result << {action: 'c', from: @square, to: p2s(-2,0), notation: 'O-O-O'}
            end
            if @color == 'b' and self.sq == 'e8' and board_state['a8']=='br' and not board_state['b8'] and not board_state['c8'] and not board_state['d8']
                result << {action: 'c', from: @square, to: p2s(-2,0), notation: 'O-O-O'}
            end
        end

        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end
end