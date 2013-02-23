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

    def p2s(dx,dy=nil)
        # returns square designation given deltas of the current coordinates
        # allows for invalid conversion, which need to be filtered out at the end
        if not dy then
            (96+@x+dx[0]).chr+(@y+dx[1]).to_s
        else
            (96+@x+dx).chr+(@y+dy).to_s
        end
    end

    def expand(board_state)
        # list possible moves based on board setup only (board_state is dict representation of the board not the board object)
        result = []

        #white pawn:
        if @color == 'w' and @type == 'p'
            debug()
            if @y==2 and not board_state[p2s(0,1)] and not board_state[p2s(0,2)] then result << {action:'m', from: @square, to: p2s(0,2), notation: p2s(0,2)} end
            displacement = 0, 1
            if @y>=2 and @y<7 and not board_state[p2s(displacement)] then result << {action:'m', from: @square, to: p2s(displacement), notation: p2s(displacement)} end
            if @y==7 and not board_state[p2s(displacement)]
                result += ['R','N','B','Q'].collect { |promo| {action: 'p', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            # captures left
            displacement = -1, 1
            if @y>=2 and @y<7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement),  notation: @square[0] + CAPTURE_SIGN + p2s(displacement) + promo} }
            end
            if @y==5 and not board_state[p2s(displacement)] and board_state[p2s(-1,0)]=='bp' then result << {action: 'e', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end

            # captures right
            displacement = 1, 1
            if @y>=2 and @y<7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement) + promo} }
            end
            if @y==5 and not board_state[p2s(displacement)] and board_state[p2s(+1,0)]=='bp' then result << {action: 'e', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end
        end

        if @color == 'b' and @type == 'p'
            debug()
            if @y==7 and not board_state[p2s(0,-1)] and not board_state[p2s(0,-2)] then result << {action:'m', from: @square, to: p2s(0,-2), notation: p2s(0,-2)} end
            displacement = 0, -1
            if @y<=7 and @y>2 and not board_state[p2s(displacement)] then result << {action:'m', from: @square, to: p2s(displacement), notation: p2s(displacement)} end
            if @y==2 and not board_state[p2s(displacement)]
                result += ['R','N','B','Q'].collect { |promo| {action: 'p', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            # captures left
            displacement = -1, -1
            if @y<=7 and @y>2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement) + promo} }
            end
            if @y==4 and not board_state[p2s(displacement)] and board_state[p2s(@x-1,@y)]=='bp' then result << {action: 'e', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end
            # captures right
            displacement = 1, -1
            if @y<=7 and @y>2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement) + promo} }
            end
            if @y==4 and not board_state[p2s(displacement)] and board_state[p2s(@x+1,@y)]=='bp' then result << {action: 'e', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end
        end

        if @type == 'n'
            [+1, -2, +2, -1, +2, +1, +1, +2, -1, -2, -2, -1, -2, +1, -1, +2].each_slice(2) do |x,y|
                if not board_state[p2s(x,y)]
                    result << {action: 'm', from: @square, to: p2s(x,y), notation: 'N'+p2s(x,y)}
                else
                    if board_state[p2s(x,y)][0] != @color then result << {action: 't', from: @square, to: p2s(x,y), notation: 'Nx'+p2s(x,y)} end
                end
            end
        end

        if ['q','k','b','r'].include? @type
            #NE=SE=SW=NW=N=E=S=W=False # flags for each direction
            if @type == 'k'
                maxrange = 1
            else
                maxrange = 7
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
            1.upto maxrange do |i|
                directions.each do |direction|
                    if not direction[:flag] and direction[:types].include? @type
                        displacement = direction[:displacement].map { |disp| disp*i }
                        if board_state.has_key?(p2s(displacement))
                            if not board_state[p2s(displacement)]
                                result << {action: 'm', from: @square, to: p2s(displacement), notation: @type.upcase + p2s(displacement)}
                            else
                                direction[:flag] = true
                                if board_state[p2s(displacement)][0] != @color then result << {action: 't', from: @square, to: p2s(displacement), notation: @type.upcase + CAPTURE_SIGN + p2s(displacement)} end
                            end
                        else
                            direction[:flag] = true
                        end
                    end
                end
            end
        end

        if @type == 'k'
            if @color == 'w' and @square == 'e1' and board_state['h1']=='wr' and not board_state['f1'] and not board_state['g1'] then result << {action: 'c', from: @square, to: p2s(2,0), notation: 'O-O'} end
            if @color == 'b' and @square == 'e8' and board_state['h8']=='br' and not board_state['f8'] and not board_state['g8'] then result << {action: 'c', from: @square, to: p2s(2,0), notation: 'O-O'} end
            if @color == 'w' and @square == 'e1' and board_state['a1']=='wr' and not board_state['b1'] and not board_state['c1'] and not board_state['d1']
                result << {action: 'c', from: @square, to: p2s(-2,0), notation: 'O-O-O'}
            end
            if @color == 'b' and @square == 'e8' and board_state['a8']=='br' and not board_state['b8'] and not board_state['c8'] and not board_state['d8']
                result << {action: 'c', from: @square, to: p2s(-2,0), notation: 'O-O-O'}
            end
        end
        puts "results #{result}"
        result.select { |expansion| expansion[:to] != nil } #excludes out of the board expansions
    end
end