#piece.rb

# def p2s(x,y)
#     # returns square designation given coordinates
#     # allows for invalid conversion, which need to be filtered out at the end
#     chr(96+x)+str(y)
# end

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
        # list possible moves based on board setup only(board_state is dict representation of the board not the board object)
        ########  result is returned as notation integrated in the command representation i.e. tuple(comm,sq,notation)

        #at = self.class.send(:define_method, { |dx,dy| board_state[p2s(dx,dy)] })


        result = []
        #if not self.onboard:
        #    return result

        # result representation in triplets of (a,sq,note) where
        #   action= one of the following desingation m=move t=take e=en passant c=castle p=promo +=take+promo
        #                             sq = square is param for the action
        #   from = current position of the piece
        #   to   = the position of the piece after the move completion
        #   note = notation*
        #     *   Notation is close to Algebraic_chess_notation http://en.wikipedia.org/wiki/Algebraic_chess_notation but
        #         the full complience will need additional steps to add disambiguation, checks and mate

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
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            if @y==5 and not board_state[p2s(displacement)] and board_state[p2s(@x-1,@y)]=='bp' then result << {action: 'e', from: @square, tp: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end
            # captures right
            displacement = 1, 1
            if @y>=2 and @y<7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            if @y==5 and not board_state[p2s(displacement)] and board_state[p2s(@x+1,@y)]=='bp' then result << {action: 'e', from: @square, tp: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end

            # if @y>=2 and @y<7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b' then result.append(('t',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
            # if @y==7 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b' end result.extend([ ('+',p2s(displacement),p2s(displacement)+z_) for z_ in ['R','N','B','Q']]) end
            # if @y==5 and board_state[p2s(displacement)]=='  ' and board_state[p2s((@x+1,@y)])=='bp' then result.append(('e',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
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
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            if @y==4 and not board_state[p2s(displacement)] and board_state[p2s(@x-1,@y)]=='bp' then result << {action: 'e', from: @square, tp: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end
            # captures right
            displacement = 1, -1
            if @y<=7 and @y>2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result << { action: 't', from: @square, to: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)}
            end
            if @y==2 and board_state[p2s(displacement)] and board_state[p2s(displacement)][0]=='b'
                result += ['R','N','B','Q'].collect { |promo| {action: '+', from: @square, to: p2s(displacement), notation: p2s(displacement) + promo} }
            end
            if @y==4 and not board_state[p2s(displacement)] and board_state[p2s(@x+1,@y)]=='bp' then result << {action: 'e', from: @square, tp: p2s(displacement), notation: @square[0] + CAPTURE_SIGN + p2s(displacement)} end


            # displacement = @x,@y-2
            # if @y==7 and board_state[p2s((@x,6)])=='  ' and board_state[p2s((@x,5)])=='  ' then result.append(('m',p2s(displacement),p2s(displacement))) end
            # displacement = @x,@y-1
            # if @y<=7 and @y>2 and board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),p2s(displacement))) end
            # if @y==2 and board_state[p2s(displacement)]=='  ' then result.extend([ ('m',p2s(displacement),p2s(displacement)+z_) for z_ in ['R','N','B','Q']]) end

            # displacement = @x-1,@y-1
            # if @y>=7 and @y>2 and board_state[p2s(displacement)][0]=='w' then result.append(('t',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
            # if @y==2 and board_state[p2s(displacement)][0]=='w' then result.extend([ ('+',p2s(displacement),p2s(displacement)+z_) for z_ in ['R','N','B','Q']]) end
            # if @y==5 and board_state[p2s(displacement)]=='  ' and board_state[p2s((@x-1,@y)])=='wp' then result.append(('e',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
            # displacement = @x+1,@y-1
            # if @y>=7 and @y>2 and board_state[p2s(displacement)][0]=='w' then result.append(('t',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
            # if @y==2 and board_state[p2s(displacement)][0]=='w' then result.extend([ ('+',p2s(displacement),p2s(displacement)+z_) for z_ in ['R','N','B','Q']]) end
            # if @y==4 and board_state[p2s(displacement)]=='  ' and board_state[p2s((@x+1,@y)])=='wp' then result.append(('e',p2s(displacement),self.sq[0]+CAPTURE_SIGN+p2s(displacement))) end
        end

        if @type == 'n'
            [@x+1, @y-2, @x+2, @y-1, @x+2, @y+1, @x+1, @y+2, @x-1, @y-2, @x-2, @y-1, @x-2, @y+1, @x-1, @y+2].each do |x,y|
                if not board_state[p2s(x,y)]
                    result << {action: 'm', from: @square, to: p2s(x,y), notation: 'N'+p2s(x,y)}
                else
                    if board_state[p2s(x,y)][0] != @color then result << {action: 't', from: @square, to: p2s(x,y), notation: 'Nx'+p2s(x,y)} end
                end
            end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement =@x+2,@y-1
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement = @x+2,@y+1
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement = @x+1,@y+2
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end

            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement = @x-1,@y-2
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement =@x-2,@y-1
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement =@x-2,@y+1
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
            # displacement =
            # if board_state[p2s(displacement)]=='  ' then result.append(('m',p2s(displacement),'N'+p2s(displacement))) end
            # displacement =@x-1,@y+2
            # if board_state[p2s(displacement)]!='  ' and board_state[p2s(displacement)][0]!=@color: result.append(('t',p2s(displacement),'Nx'+p2s(displacement))) end
        end

        if ['q','k','b','r'].include? @type
            #NE=SE=SW=NW=N=E=S=W=False # flags for each direction
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

                # {name: 'E' , flag: false, types: ['q','r','k'], displacement: lambda { |x,y,j| x+j, y   }},
                # {name: 'SE', flag: false, types: ['q','b','k'], displacement: lambda { |x,y,j| x+j, y-j }},
                # {name: 'S' , flag: false, types: ['q','r','k'], displacement: lambda { |x,y,j| x  , y-j }},
                # {name: 'SW', flag: false, types: ['q','b','k'], displacement: lambda { |x,y,j| x-j, y-j }},
                # {name: 'W' , flag: false, types: ['q','r','k'], displacement: lambda { |x,y,j| x-j, y   }},
                # {name: 'NW', flag: false, types: ['q','b','k'], displacement: lambda { |x,y,j| x-j, y+j }},
                # {name: 'N' , flag: false, types: ['q','r','k'], displacement: lambda { |x,y,j| x  , y+j }},

                # {name: 'E', flag: false, disp_x: :+, disp_y: nil},
                # {name: 'SE', flag: false, disp_x: :+, disp_y: :-},
                # {name: 'S', flag: false, disp_x: nil, disp_y: :-},
                # {name: 'SW', flag: false, disp_x: :-, disp_y: :-},
                # {name: 'W', flag: false, disp_x: :-, disp_y: nil},
                # {name: 'NW', flag: false, disp_x: :-, disp_y: :+},
                # {name: 'N', flag: false, disp_x: nil, disp_y: :+},
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


                # displacement = @x+i,@y+i
                # if not NE and @type in ['q','b','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         NE = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x+i,@y-i
                # if not SE and @type in ['q','b','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         SE = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x-i,@y-i
                # if not SW and @type in ['q','b','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         SW = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x-i,@y+i
                # if not NW and @type in ['q','b','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         NW = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x,@y+i
                # if not N and @type in ['q','r','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         N = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x+i,@y
                # if not E and @type in ['q','r','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         E = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x,@y-i
                # if not S and @type in ['q','r','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         S = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))

                # displacement = @x-i,@y
                # if not W and @type in ['q','r','k']:
                #     if board_state[p2s(displacement)]=='  ':
                #         result.append(('m',p2s(displacement),@type.upper()+p2s(displacement)))
                #     else:
                #         W = True
                #         if board_state[p2s(displacement)][0]!=@color:
                #             result.append(('t',p2s(displacement),@type.upper()+'x'+p2s(displacement)))
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