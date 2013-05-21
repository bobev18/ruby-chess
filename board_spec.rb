#board_spec.rb
require "rspec"
require './board.rb'

TEST_BOARD1 = {'h8' => nil, 'h2' => nil, 'h3' => nil, 'h1' => 'wr', 'h6' => nil, 'h7' => 'wp', 'h4' => nil, 'h5' => nil, 'd8' => 'bq', 'a8' => 'br', 'd6' => nil, 'd7' => 'bp', 'd4' => nil, 'd5' => nil, 'd2' => 'wp', 'd3' => nil, 'd1' => 'wq', 'g7' => 'bp', 'g6' => nil, 'g5' => 'wp', 'g4' => nil, 'g3' => nil, 'g2' => nil, 'g1' => nil, 'g8' => 'bn', 'c8' => 'bb', 'c3' => 'bn', 'c2' => 'wp', 'c1' => 'wb', 'c7' => 'bp', 'c6' => nil, 'c5' => nil, 'c4' => nil, 'f1' => 'wb', 'f2' => 'wp', 'f3' => nil, 'f4' => nil, 'f5' => 'bp', 'f6' => nil, 'f7' => nil, 'f8' => 'bb', 'b4' => nil, 'b5' => nil, 'b6' => nil, 'b7' => 'bp', 'b1' => 'wn', 'b2' => 'wp', 'b3' => nil, 'b8' => nil, 'a1' => 'wr', 'a3' => nil, 'a2' => 'wp', 'a5' => nil, 'e8' => 'bk', 'a7' => 'bp', 'a6' => nil, 'e5' => nil, 'e4' => 'wn', 'e7' => 'bp', 'e6' => nil, 'e1' => 'wk', 'e3' => nil, 'e2' => 'wp', 'a4' => nil}
TEST_BOARD2 = {'h8' => nil, 'h2' => nil, 'h3' => nil, 'h1' => 'wr', 'h6' => nil, 'h7' => nil, 'h4' => nil, 'h5' => nil, 'd8' => 'bq', 'a8' => 'br', 'd6' => nil, 'd7' => 'bb', 'd4' => nil, 'd5' => nil, 'd2' => nil, 'd3' => nil, 'd1' => 'wq', 'g7' => nil, 'g6' => nil, 'g5' => nil, 'g4' => nil, 'g3' => nil, 'g2' => nil, 'g1' => nil, 'g8' => 'bn', 'c8' => 'bb', 'c3' => 'bn', 'c2' => nil, 'c1' => 'wb', 'c7' => nil, 'c6' => nil, 'c5' => nil, 'c4' => nil, 'f1' => 'wb', 'f2' => nil, 'f3' => nil, 'f4' => nil, 'f5' => nil, 'f6' => nil, 'f7' => nil, 'f8' => 'bb', 'b4' => nil, 'b5' => 'wb', 'b6' => nil, 'b7' => 'wr', 'b1' => 'wn', 'b2' => nil, 'b3' => nil, 'b8' => nil, 'a1' => 'wr', 'a3' => nil, 'a2' => nil, 'a5' => nil, 'e8' => 'bk', 'a7' => nil, 'a6' => nil, 'e5' => 'bq', 'e4' => nil, 'e7' => nil, 'e6' => nil, 'e1' => 'wk', 'e3' => nil, 'e2' => nil, 'a4' => nil}
TEST_RESULT2W = {"a1"=>false, "a2"=>true, "a3"=>true, "a4"=>true, "a5"=>true, "a6"=>true, "a7"=>true, "a8"=>true, "b1"=>true, "b2"=>true, "b3"=>true, "b4"=>false, "b5"=>true, "b6"=>true, "b7"=>false, "b8"=>true, "c1"=>true, "c2"=>true, "c3"=>true, "c4"=>true, "c5"=>false, "c6"=>true, "c7"=>true, "c8"=>false, "d1"=>true, "d2"=>true, "d3"=>true, "d4"=>true, "d5"=>true, "d6"=>true, "d7"=>true, "d8"=>false, "e1"=>true, "e2"=>true, "e3"=>true, "e4"=>false, "e5"=>false, "e6"=>false, "e7"=>false, "e8"=>false, "f1"=>true, "f2"=>true, "f3"=>true, "f4"=>true, "f5"=>false, "f6"=>false, "f7"=>false, "f8"=>false, "g1"=>true, "g2"=>true, "g3"=>false, "g4"=>true, "g5"=>true, "g6"=>false, "g7"=>false, "g8"=>false, "h1"=>false, "h2"=>true, "h3"=>true, "h4"=>true, "h5"=>true, "h6"=>true, "h7"=>true, "h8"=>true}
TEST_BOARD3 = {'h8' => 'br', 'h2' => 'wp', 'h3' => nil, 'h1' => 'wr', 'h6' => 'bn', 'h7' => 'bp', 'h4' => nil, 'h5' => nil, 'd8' => 'bq', 'a8' => 'br', 'd6' => 'bp', 'd7' => nil, 'd4' => nil, 'd5' => nil, 'd2' => 'wp', 'd3' => nil, 'd1' => 'wq', 'g7' => 'bp', 'g6' => nil, 'g5' => nil, 'g4' => nil, 'g3' => nil, 'g2' => 'wp', 'g1' => 'wn', 'g8' => nil, 'c8' => 'bb', 'c3' => nil, 'c2' => 'wp', 'c1' => 'wb', 'c7' => 'bp', 'c6' => nil, 'c5' => nil, 'c4' => nil, 'f1' => nil, 'f2' => 'wp', 'f3' => nil, 'f4' => nil, 'f5' => nil, 'f6' => nil, 'f7' => 'bp', 'f8' => 'bb', 'b4' => nil, 'b5' => 'wb', 'b6' => nil, 'b7' => 'bp', 'b1' => 'wn', 'b2' => 'wp', 'b3' => nil, 'b8' => 'bn', 'a1' => 'wr', 'a3' => nil, 'a2' => 'wp', 'a5' => nil, 'e8' => 'bk', 'a7' => 'bp', 'a6' => nil, 'e5' => nil, 'e4' => 'wp', 'e7' => 'bp', 'e6' => nil, 'e1' => 'wk', 'e3' => nil, 'e2' => nil, 'a4' => nil}
TEST_RESULT3W = {"a1"=>false, "a2"=>true, "a3"=>true, "a4"=>true, "a5"=>false, "a6"=>true, "a7"=>false, "a8"=>false, "b1"=>true, "b2"=>true, "b3"=>true, "b4"=>false, "b5"=>false, "b6"=>false, "b7"=>false, "b8"=>false, "c1"=>true, "c2"=>true, "c3"=>true, "c4"=>true, "c5"=>false, "c6"=>true, "c7"=>false, "c8"=>false, "d1"=>true, "d2"=>true, "d3"=>true, "d4"=>false, "d5"=>true, "d6"=>false, "d7"=>true, "d8"=>false, "e1"=>true, "e2"=>true, "e3"=>true, "e4"=>false, "e5"=>false, "e6"=>false, "e7"=>false, "e8"=>true, "f1"=>true, "f2"=>true, "f3"=>true, "f4"=>false, "f5"=>true, "f6"=>false, "f7"=>false, "f8"=>false, "g1"=>true, "g2"=>false, "g3"=>true, "g4"=>true, "g5"=>false, "g6"=>false, "g7"=>false, "g8"=>false, "h1"=>false, "h2"=>true, "h3"=>true, "h4"=>false, "h5"=>true, "h6"=>false, "h7"=>false, "h8"=>false}
TEST_RESULT3B = {"a1"=>false, "a2"=>false, "a3"=>false, "a4"=>false, "a5"=>false, "a6"=>true, "a7"=>true, "a8"=>false, "b1"=>false, "b2"=>false, "b3"=>false, "b4"=>false, "b5"=>false, "b6"=>true, "b7"=>true, "b8"=>true, "c1"=>false, "c2"=>false, "c3"=>false, "c4"=>false, "c5"=>true, "c6"=>true, "c7"=>true, "c8"=>true, "d1"=>false, "d2"=>false, "d3"=>false, "d4"=>false, "d5"=>false, "d6"=>true, "d7"=>true, "d8"=>true, "e1"=>false, "e2"=>false, "e3"=>false, "e4"=>false, "e5"=>true, "e6"=>true, "e7"=>true, "e8"=>true, "f1"=>false, "f2"=>false, "f3"=>false, "f4"=>false, "f5"=>true, "f6"=>true, "f7"=>true, "f8"=>true, "g1"=>false, "g2"=>false, "g3"=>false, "g4"=>true, "g5"=>false, "g6"=>true, "g7"=>true, "g8"=>true, "h1"=>false, "h2"=>false, "h3"=>true, "h4"=>false, "h5"=>false, "h6"=>true, "h7"=>true, "h8"=>false}
TEST_BOARD4 = {'h8' => nil, 'h2' => nil, 'h3' => 'wp', 'h1' => 'wr', 'h6' => nil, 'h7' => 'bp', 'h4' => nil, 'h5' => nil, 'd8' => 'bk', 'a8' => 'br', 'd6' => 'wp', 'd7' => nil, 'd4' => nil, 'd5' => nil, 'd2' => nil, 'd3' => nil, 'd1' => 'wr', 'g7' => 'bq', 'g6' => nil, 'g5' => nil, 'g4' => nil, 'g3' => 'wp', 'g2' => 'wp', 'g1' => nil, 'g8' => nil, 'c8' => 'bb', 'c3' => 'wn', 'c2' => 'wp', 'c1' => 'wk', 'c7' => nil, 'c6' => 'bp', 'c5' => nil, 'c4' => nil, 'f1' => nil, 'f2' => nil, 'f3' => 'wq', 'f4' => nil, 'f5' => nil, 'f6' => nil, 'f7' => 'wb', 'f8' => nil, 'b4' => nil, 'b5' => nil, 'b6' => nil, 'b7' => 'bp', 'b1' => nil, 'b2' => 'wp', 'b3' => nil, 'b8' => 'bn', 'a1' => nil, 'a3' => nil, 'a2' => 'wp', 'a5' => nil, 'e8' => nil, 'a7' => 'bp', 'a6' => nil, 'e5' => nil, 'e4' => nil, 'e7' => 'bp', 'e6' => nil, 'e1' => nil, 'e3' => nil, 'e2' => nil, 'a4' => nil}

describe Board do
    describe '#show' do
        it '#initialset generates board with initial set of piece objects, and #show displays the board' do
            zboard = Board.new
            zboard.initialset
            # puts "#{zboard.show}"
            # puts "\n"
            zboard.show.should eq "
|br|bn|bb|bq|bk|bb|bn|br|
|bp|bp|bp|bp|bp|bp|bp|bp|
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |  |  |  |
|wp|wp|wp|wp|wp|wp|wp|wp|
|wr|wn|wb|wq|wk|wb|wn|wr|
"
        end
    end

    describe '#piecefy' do
        it 'generates board with set of piece objects given specific position' do
            zboard = Board.new
            zboard.piecefy(TEST_BOARD1)
            zboard.show.should eq "
|br|  |bb|bq|bk|bb|bn|  |
|bp|bp|bp|bp|bp|  |bp|wp|
|  |  |  |  |  |  |  |  |
|  |  |  |  |  |bp|wp|  |
|  |  |  |  |wn|  |  |  |
|  |  |bn|  |  |  |  |  |
|wp|wp|wp|wp|wp|wp|  |  |
|wr|wn|wb|wq|wk|wb|  |wr|
"
        end
    end

    describe '#piece_by_sq' do
        it 'returns the object at specific board location' do
            zboard = Board.new
            zboard.initialset
            zpiece = zboard.piece_by_sq('e2')
            zpiece.to_s.should eq 'wp@e2'
            zpiece.square.should eq 'e2'
        end
    end

    describe '#relocate' do
        it 'relocates piece to an empty square TO_SQ' do
            zboard = Board.new
            zboard.initialset
            zboard.relocate('b8', 'c3')
            zboard.piece_by_sq('c3').to_s.should eq "bn@c3"
            zboard.relocate('g1', 'e4')
            zboard.piece_by_sq('e4').to_s.should eq 'wn@e4'
            zboard.relocate('g2', 'g5')
            zboard.piece_by_sq('g5').to_s.should eq 'wp@g5'
            zboard.relocate(zboard.piece_by_sq('f7'), 'f5')
            zboard.piece_by_sq('f5').to_s.should eq 'bp@f5'
            # puts zboard.show
            expect { zboard.relocate(zboard.piece_by_sq('f5'), 'g5') }.to raise_error(MoveException)#,"Trying to move the air at h3")
            expect { zboard.relocate('a3', 'a4') }.to raise_error(MoveException)#,"Trying to move the air at h3")
        end
    end

    describe '#take' do
        it 'removes piece from the board' do
            zboard = Board.new
            zboard.initialset
            zboard.take('h7')
            zboard.piece_by_sq('h7').should eq nil
            zboard.take(zboard.piece_by_sq('h8'))
            zboard.relocate(zboard.piece_by_sq('h2'), 'h7') # the relocate here is an attempt to break something with the take
            zboard.piece_by_sq('h7').to_s.should eq 'wp@h7'
            zboard.piece_by_sq('h8').should eq nil
            expect { zboard.take(zboard.piece_by_sq('h3')) }.to raise_error(MoveException)#,"Trying to move the air at h3")
        end
    end

    describe '#add' do
        it 'adds piece to the board' do
            zboard = Board.new
            zboard.add('b5', 'w', 'b')
            zboard.add('e5', 'b', 'q')
            zboard.add('bb@d7')
            zboard.add('wr@b7')
            # puts zboard.show
            zboard.piece_by_sq('b5').to_s.should eq 'wb@b5'
            zboard.piece_by_sq('e5').to_s.should eq 'bq@e5'
            zboard.piece_by_sq('d7').to_s.should eq 'bb@d7'
            zboard.piece_by_sq('b7').to_s.should eq 'wr@b7'
            expect { zboard.add('wb@e5') }.to raise_error(MoveException)
        end
    end

    describe '#sq_in_check' do
        it 'verifies if a sq is in check' do
            zboard = Board.new
            # testing with BOARD2
            zboard.piecefy(TEST_BOARD2)
            # puts zboard.show
            # |br|  |bb|bq|bk|bb|bn|  |
            # |  |wr|  |bb|  |  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |  |wb|  |  |bq|  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |  |  |bn|  |  |  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |wr|wn|wb|wq|wk|wb|  |wr|
            zboard.sq_in_check('e1','b').should be_true
            zboard.sq_in_check('e2','b').should be_true
            zboard.sq_in_check('f2','b').should be_false
            zboard.sq_in_check('d2','b').should be_false
            somelist = {}
            zboard.board.each { |k,v| somelist[k]=zboard.sq_in_check(k,'w') }
            somelist.should eq TEST_RESULT2W
            

            # testing with BOARD3
            zboard.piecefy(TEST_BOARD3)
            # |br|bn|bb|bq|bk|bb|  |br|
            # |bp|bp|bp|  |bp|bp|bp|bp|
            # |  |  |  |bp|  |  |  |bn|
            # |  |wb|  |  |  |  |  |  |
            # |  |  |  |  |wp|  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |wp|wp|wp|wp|  |wp|wp|wp|
            # |wr|wn|wb|wq|wk|  |wn|wr|
            zboard.sq_in_check('e8','w').should be_true
            somelist = {}
            zboard.board.each { |k,v| somelist[k] = zboard.sq_in_check(k,'w') }
            somelist.should eq TEST_RESULT3W

            somelist = {}
            zboard.board.each { |k,v| somelist[k] = zboard.sq_in_check(k,'b') }
            somelist.should eq TEST_RESULT3B

            # # puts somelist
            # result = "\n"
            # 8.downto(1) do |i|
            #     result += "|"
            #     97.upto(104) do |j|
            
            #         addition = somelist[j.chr() + i.to_s] ? " t" : "  "
            #         result +=  addition + "|"
            #     end
            #     result += "\n" # -- -- -- -- -- -- -- --\n"
            # end
            # puts result
            # ss = somelist.to_s[1..-1]
            # box = ss.split(', ')
            # puts box.sort!.map! { |k| "#{k}" }.join(", ")

            # TODO:
            # add check of the full check map of both BOARDs 2 & 3 i.e. validate every square result


            ##### the test below was under #sq_in_check, but should be moved to #valids
            # zboard.piecefy(TEST_BOARD4)
            # self.assertFalse(('m', 'c7', 'Kc7')in self.zboard.valids(self.zboard.piece_by_sq('d8')))
        end
    end



end

#     def test_incheck_checks(self):
#         self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wq', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': '  ', 'c1': 'wb', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': 'wn', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': '  ', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print('\n'+self.zboard.show())
#         """
#         |br|  |bb|bq|bk|bb|bn|  |
#         |  |wr|  |bb|  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |wb|  |  |bq|  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |wr|wn|wb|wq|wk|wb|  |wr|
#         """

#         self.assertTrue(self.zboard.sq_in_check('e1','b'))
#         self.assertTrue(self.zboard.sq_in_check('e2','b'))
#         self.assertFalse(self.zboard.sq_in_check('f2','b'))
#         self.assertFalse(self.zboard.sq_in_check('d2','b'))
#         self.zboard.piecefy({'h8': 'br', 'h2': 'wp', 'h3': '  ', 'h1': 'wr', 'h6': 'bn', 'h7': 'bp', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': 'bp', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': 'wp', 'd3': '  ', 'd1': 'wq', 'g7': 'bp', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': 'wp', 'g1': 'wn', 'g8': '  ', 'c8': 'bb', 'c3': '  ', 'c2': 'wp', 'c1': 'wb', 'c7': 'bp', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': 'wp', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': 'bp', 'f8': 'bb', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'bp', 'b1': 'wn', 'b2': 'wp', 'b3': '  ', 'b8': 'bn', 'a1': 'wr', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': 'bk', 'a7': 'bp', 'a6': '  ', 'e5': '  ', 'e4': 'wp', 'e7': 'bp', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         self.assertTrue(self.zboard.sq_in_check('e8','w'))

#         self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': 'wp', 'h1': 'wr', 'h6': '  ', 'h7': 'bp', 'h4': '  ', 'h5': '  ', 'd8': 'bk', 'a8': 'br', 'd6': 'wp', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wr', 'g7': 'bq', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': 'wp', 'g2': 'wp', 'g1': '  ', 'g8': '  ', 'c8': 'bb', 'c3': 'wn', 'c2': 'wp', 'c1': 'wk', 'c7': '  ', 'c6': 'bp', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': 'wq', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': 'wb', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': '  ', 'b2': 'wp', 'b3': '  ', 'b8': 'bn', 'a1': '  ', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': '  ', 'a7': 'bp', 'a6': '  ', 'e5': '  ', 'e4': '  ', 'e7': 'bp', 'e6': '  ', 'e1': '  ', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print '\n'+self.zboard.show()
#         #print self.zboard.valids(self.zboard.piece_by_sq('d8'))
#         self.assertFalse(('m', 'c7', 'Kc7')in self.zboard.valids(self.zboard.piece_by_sq('d8')))


#     def test_validate_against_checks(self):
#         #note:since we dont have the the game class, we will use the _piecefy_ to reset the board back after executing every expansion for evaluation
#         self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wq', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': '  ', 'c1': 'wb', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': 'wn', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print('\n'+self.zboard.show())

#         """
#         |br|  |bb|bq|bk|bb|bn|  |
#         |  |wr|  |bb|  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |wb|  |  |bq|  |  |  |
#         |  |  |  |  |wn|  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |wr|wn|wb|wq|wk|wb|  |wr|
#         """

#         resulting_expansions = {}
#         for p in self.zboard.fullset():
#             zkey = p.sq # original position of the pece we're working with denotes the key for the results

#             ### The segment below was outdated since the introduction of method board.validate_all_moves
#             ### The method board.validate_move, should be used to validate moves by the king, or in situations where there is already a king in check
#             if p.col == 'w':
#                 oposite_col = 'b'
#             else:
#                 oposite_col = 'w'
#             reductions = [] # list of the moves which will be excluded form the expansions, due to opening check
#             expansions = p.expand(self.zboard.board)
#             for e in expansions:
#                 #if p.sq=='e4':
#                 #    print(p,e,v)
#                 #    v = self.zboard.validate_move(p,e,1)
#                 #else:
#                 if p.type == 'k':
#                     v = self.zboard.validate_all_moves(p,e)
#                 else:
#                     v = self.zboard.validate_move(p,e)

#                 if not v:
#                     reductions.append(e)

#             resulting_expansions[zkey] = [x for x in expansions if x not in reductions]

#         # the knight at e4, will have the expansion list reduced to []
#         self.assertEqual([],resulting_expansions['e4'])
#         #bishop at d7 previously had [('m', 'f5', 'Bf5'),('m', 'g4', 'Bg4'),('m', 'e6', 'Be6'),('t', 'b5', 'Bxb5'),('m', 'c6', 'Bc6'),('m', 'h3', 'Bh3')], but now
#         self.assertEqual(set([('t', 'b5', 'Bxb5'),('m', 'c6', 'Bc6')]),set(resulting_expansions['d7']))
#         #king at e1 -- validated the move to e2 as it's hit by the knight at c3
#         self.assertFalse(('m','e2','Ke2') in resulting_expansions['e1'])

#         self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': 'bn', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print('\n'+self.zboard.show())
#         """
#         |br|  |  |  |bk|  |  |  |
#         |  |wr|  |bb|  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |wb|  |  |bq|  |  |  |
#         |  |  |  |  |wn|  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |wr|  |  |  |wk|  |  |wr|
#         """
#         #king at e1 should not expand queen side castle dure to N@c3 hitting d1
#         reductions = [] # list of the moves which will be excluded form the expansions, due to opening check
#         expansions = self.zboard.piece_by_sq('e1').expand(self.zboard.board)
#         for e in expansions:
#             if not self.zboard.validate_all_moves(self.zboard.piece_by_sq('e1'),e): ## validate_all_moves because checking the king at e1
#                 reductions.append(e)
#         self.assertTrue(('c','c1','O-O-O') in reductions)


#     def test_valids_expansion(self):
#         self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': 'bn', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print('\n'+self.zboard.show())
#         """
#         |br|  |  |  |bk|  |  |  |
#         |  |wr|  |bb|  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |wb|  |  |bq|  |  |  |
#         |  |  |  |  |wn|  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |wr|  |  |  |wk|  |  |wr|
#         """
#         #king at e1 should not expand queen side castle dure to N@c3 hitting d1
#         #king at e1 should not expand to e2 as it's hit by the N@c3
#         self.assertEqual(set([('m', 'd2', 'Kd2'),('m', 'f2', 'Kf2'),('m', 'f1', 'Kf1'),('c', 'g1', 'O-O')]),set(self.zboard.valids(self.zboard.piece_by_sq('e1'))))


#     def test_decode_move(self):
#         #def __init__(self,wplayer='human',bplayer='human',clock=60*60):
#         #too simple --- def turnset(self):
#         #not significant for performance --- def show(self):
#         #interactive --- def prompt_human_move(self):
#         #not ready --- def AI_move(self,depth=5,verbose=0):
#         #requires special history setup --- def verified(self,piece):
#         #requires special setup --- def mate(self):
#         #not ready --- def stalemate(self):
#         # ** takes setup since based on the pieces set ! --- def decode_move(self, move_notation, piece_set):
#         #    return (filtered[0],(move_type,destination,move))
#         #interactive --- def cycle(self):
#         # * next test - create test mode for cycle, that replaces the prompt_human_move func
#         zgame = chesslib.game()
#         zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': 'bn', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print('\n'+zgame.zboard.show())
#         """
#         |br|  |  |  |bk|  |  |  |
#         |  |wr|  |bb|  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |  |wb|  |  |bq|  |  |  |
#         |  |  |  |  |wn|  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |  |  |  |  |  |  |  |  |
#         |wr|  |  |  |wk|  |  |wr|
#         """
#         self.assertEqual((zgame.zboard.piece_by_sq('e1'),'e1','m','f2','Kf2'),zgame.decode_move('13. Kf2',zgame.turnset()))
#         self.assertEqual((zgame.zboard.piece_by_sq('e1'),'e1','c','g1','O-O'),zgame.decode_move('O-O',zgame.turnset()))
#         # O-O-O because it only decodes against the set, without validation
#         self.assertEqual((zgame.zboard.piece_by_sq('e1'),'e1','c','c1','O-O-O'),zgame.decode_move('O-O-O',zgame.turnset()))
#         #print(zgame.show())
#         self.assertEqual((zgame.zboard.piece_by_sq('b5'),'b5','t','d7','Bxd7'),zgame.decode_move('Bxd7+',zgame.turnset()))
#         zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': 'wp', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bp', 'd4': '  ', 'd5': '  ', 'd2': 'wp', 'd3': '  ', 'd1': 'wq', 'g7': 'bp', 'g6': '  ', 'g5': 'wp', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': 'wp', 'c1': 'wb', 'c7': 'bp', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': 'wp', 'f3': '  ', 'f4': '  ', 'f5': 'bp', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': 'wn', 'b2': 'wp', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': 'bk', 'a7': 'bp', 'a6': '  ', 'e5': '  ', 'e4': 'wn', 'e7': 'bp', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': 'wp', 'a4': '  '})
#         """
#         |br|  |bb|bq|bk|bb|bn|  |
#         |bp|bp|bp|bp|bp|  |bp|wp|
#         |  |  |  |  |  |  |  |  |
#         |  |  |  |  |  |bp|wp|  |
#         |  |  |  |  |wn|  |  |  |
#         |  |  |bn|  |  |  |  |  |
#         |wp|wp|wp|wp|wp|wp|  |  |
#         |wr|wn|wb|wq|wk|wb|  |wr|
#         """
#         #print(zgame.show())
#         self.assertEqual((zgame.zboard.piece_by_sq('h7'),'h7','p','h8','h8Q'),zgame.decode_move('h8Q',zgame.turnset()))
#         self.assertEqual((zgame.zboard.piece_by_sq('h7'),'h7','+','g8','hxg8N'),zgame.decode_move('hxg8N',zgame.turnset()))
#         #print(zgame.decode_move('Rxh7',zgame.turnset())) # cant promote to King
#         self.assertRaises(chesslib.MoveException, zgame.decode_move, '999. b8',zgame.turnset())  # no pawn to reach b8
#         self.assertRaises(chesslib.MoveException, zgame.decode_move, '2 fxgdfgdfgsdfg',zgame.turnset())  # ##cannot take own
#         self.assertRaises(chesslib.MoveException, zgame.decode_move, 'Ra3',zgame.turnset())  # invalid

#         #e.p.
#         self.assertEqual((zgame.zboard.piece_by_sq('g5'),'g5','e','f6','gxf6'),zgame.decode_move('gxf6',zgame.turnset()))

#     def test_game_cycle_n_mate(self):
#         zgame = chesslib.game()
#         self.assertEqual('1-0',zgame.cycle(['1. e4','e5','2. Bc4','a6','3. Qf3','b5','Qxf7#'],0,verbose=0))
#         #print(zgame.full_notation)

#     def test_game_cycle_stalemate(self):
#         zgame = chesslib.game()
#         # Stalemate
#         zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': 'bn', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         self.assertEqual('1/2-1/2',zgame.cycle(['Bxd7','Kd8','Rh7','Ra2','Rxa2','Qa5','Rxa5','Ne2','Kxe2'],0,verbose=0)) #stalemate

#         # Draws
#         zgame = chesslib.game()
#         zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': '  ', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': '  ', 'd6': '  ', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': '  ', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': '  ', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': '  ', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': '  ', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': 'wq', 'a4': '  '})
#         self.assertEqual('1/2-1/2',zgame.cycle(['Kd1','Qxe2','Kxe2','Ke7'],0,verbose=0))# draw -- should trigger on Kxe2
#         ### insert here test for King + light piece vs King draws ###

#         # Repetition Draw
#         zgame = chesslib.game()
#         zgame.zboard.piecefy({'h8': 'bk', 'h2': '  ', 'h3': '  ', 'h1': '  ', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': '  ', 'd6': '  ', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': '  ', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': '  ', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': '  ', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': '  ', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': '  ', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': 'wq', 'a4': '  '})
#         self.assertEqual('1/2-1/2',zgame.cycle(['Kd1','Qd5+','2.Qd2','Qh1+','Qe1','Qd5','4.Qd2','Qh1+','5.Qe1','Qh5+','Qe2','Qh1','Qe1','Qd5'],0,verbose=0))# draw by repetition

#     def test_game_undo(self):
#         zgame = chesslib.game()
#         zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': '  ', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': '  ', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': '  ', 'c8': '  ', 'c3': 'bn', 'c2': '  ', 'c1': '  ', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': '  ', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': '  ', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #print(zgame.show())
#         zgame.cycle(['Bxd7','Kd8','Rh7','Ra2','Rxa2','Qa5'],0,verbose=0)
#         zgame.undo()
#         #print(zgame.show())
#         self.assertEqual("""|  |  |  |bk|  |  |  |  |
# |  |wr|  |wb|  |  |  |wr|
# |  |  |  |  |  |  |  |  |
# |  |  |  |  |bq|  |  |  |
# |  |  |  |  |wn|  |  |  |
# |  |  |bn|  |  |  |  |  |
# |wr|  |  |  |  |  |  |  |
# |  |  |  |  |wk|  |  |  |
# """,zgame.zboard.show()) #before 'Qa5'

#         zgame.undo()
#         #print(zgame.show())
#         self.assertEqual("""|  |  |  |bk|  |  |  |  |
# |  |wr|  |wb|  |  |  |wr|
# |  |  |  |  |  |  |  |  |
# |  |  |  |  |bq|  |  |  |
# |  |  |  |  |wn|  |  |  |
# |  |  |bn|  |  |  |  |  |
# |br|  |  |  |  |  |  |  |
# |wr|  |  |  |wk|  |  |  |
# """,zgame.zboard.show()) #before 'Rxa2' #by black

#     def test_game_ai_vs_ai(self):
#         some_game = chesslib.game(wplayer='ai',bplayer='ai',logfile='d:\\temp\\aiaigametest.txt')
#         some_game.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': 'wp', 'h1': 'wr', 'h6': '  ', 'h7': 'bp', 'h4': '  ', 'h5': '  ', 'd8': 'bk', 'a8': 'br', 'd6': 'bp', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wr', 'g7': 'bq', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': 'wp', 'g2': 'wp', 'g1': '  ', 'g8': '  ', 'c8': 'bb', 'c3': 'wn', 'c2': 'wp', 'c1': 'wk', 'c7': '  ', 'c6': 'bp', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': 'wq', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': 'wb', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': '  ', 'b2': 'wp', 'b3': '  ', 'b8': 'bn', 'a1': '  ', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': '  ', 'a7': 'bp', 'a6': '  ', 'e5': 'wp', 'e4': '  ', 'e7': 'bp', 'e6': '  ', 'e1': '  ', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         zgame = chesslib.game(wplayer='ai',bplayer='ai',logfile='d:\\temp\\aiaigametest.txt')
#         zgame.zboard = copy.deepcopy(some_game.zboard)
#         zgame.cycle(aidepth=4,verbose=0) # aidepth=2 results in about 8 sec run
#         #print zgame.full_notation


#     def test_game_cycle_ai(self):
#         zgame = chesslib.game(bplayer='ai',logfile='d:\\temp\\aigametest.txt') # using log different from the defailt, so that it doesn't get overwrittent by subsequent test
#         """
#         zgame.full_notation= '''1. e4 e6
# 2. d4 Bb4+
# 3. Nc3 b6
# 4. a3 Bxc3+
# 5. bxc3 Ba6
# 6. Bxa6 Nxa6
# 7. Nf3 Nb8
# 8. Bg5 Qc8
# 9. O-O Nf6
# 10. Qd3 h5
# 11. c4 Nh7
# 12. Bf4 f6
# 13. Rad1 Nc6
# 14. d5 Ne7
# 15. dxe6 dxe6
# 16. c5 Ng6
# 17. Be3 a5
# 18. cxb6 cxb6
# 19. Qb5+ Kf7
# 20. Qxh5 Qxc2'''
#         """
#         #zgame.zboard.piecefy({'h8': 'br', 'h2': 'wp', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': 'bp', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bp', 'd4': 'bn', 'd5': '  ', 'd2': '  ', 'd3': 'wp', 'd1': 'wq', 'g7': 'bp', 'g6': '  ', 'g5': 'wb', 'g4': '  ', 'g3': '  ', 'g2': 'wp', 'g1': '  ', 'g8': '  ', 'c8': 'bb', 'c3': 'wn', 'c2': 'wp', 'c1': '  ', 'c7': 'bp', 'c6': '  ', 'c5': '  ', 'c4': 'wb', 'f1': '  ', 'f2': 'wp', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': 'bn', 'f7': 'bp', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': '  ', 'b2': 'wp', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': 'wp', 'a2': '  ', 'a5': '  ', 'e8': '  ', 'a7': 'bp', 'a6': '  ', 'e5': 'bp', 'e4': 'wp', 'e7': 'bk', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #zgame.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': 'wp', 'h1': 'wr', 'h6': '  ', 'h7': 'bp', 'h4': '  ', 'h5': '  ', 'd8': 'bk', 'a8': 'br', 'd6': 'bp', 'd7': '  ', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wr', 'g7': 'bq', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': 'wp', 'g2': 'wp', 'g1': '  ', 'g8': '  ', 'c8': 'bb', 'c3': 'wn', 'c2': 'wp', 'c1': 'wk', 'c7': '  ', 'c6': 'bp', 'c5': '  ', 'c4': '  ', 'f1': '  ', 'f2': '  ', 'f3': 'wq', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': 'wb', 'f8': '  ', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': '  ', 'b2': 'wp', 'b3': '  ', 'b8': 'bn', 'a1': '  ', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': '  ', 'a7': 'bp', 'a6': '  ', 'e5': 'wp', 'e4': '  ', 'e7': 'bp', 'e6': '  ', 'e1': '  ', 'e3': '  ', 'e2': '  ', 'a4': '  '})
#         #cProfile.run('zgame.cycle(aidepth=4)')
#         #zgame.cycle(aidepth=4)
#         #print('raboti li',file=zgame.log)
#         #compile the lib!


# if __name__ == "__main__":
#     try: unittest.main()
#     except SystemExit: pass



