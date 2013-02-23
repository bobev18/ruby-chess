#piece_spec.rb
require './piece.rb'

PLAIN_BOARD = {'a8' => 'br', 'b8' => nil, 'c8' => 'bb', 'd8' => 'bq', 'e8' => 'bk', 'f8' => 'bb', 'g8' => 'bn', 'h8' => 'br',
                 'a7' => 'bp', 'b7' => 'bp', 'c7' => 'bp', 'd7' => 'bp', 'e7' => 'bp', 'f7' => 'bp', 'g7' => 'bp', 'h7' => 'bp',
                 'a6' => nil, 'b6' => nil, 'c6' => nil, 'd6' => nil, 'e6' => nil, 'f6' => nil, 'g6' => nil, 'h6' => nil,
                 'a5' => nil, 'b5' => nil, 'c5' => nil, 'd5' => nil, 'e5' => nil, 'f5' => nil, 'g5' => nil, 'h5' => nil,
                 'a4' => nil, 'b4' => nil, 'c4' => nil, 'd4' => nil, 'e4' => nil, 'f4' => nil, 'g4' => nil, 'h4' => nil,
                 'a3' => nil, 'b3' => nil, 'c3' => nil, 'd3' => nil, 'e3' => nil, 'f3' => nil, 'g3' => nil, 'h3' => nil,
                 'a2' => 'wp', 'b2' => 'wp', 'c2' => 'wp', 'd2' => 'wp', 'e2' => 'wp', 'f2' => 'wp', 'g2' => 'wp', 'h2' => 'wp',
                 'a1' => 'wr', 'b1' => 'wn', 'c1' => 'wb', 'd1' => 'wq', 'e1' => 'wk', 'f1' => 'wb', 'g1' => 'wn', 'h1' => 'wr',}

TEST1_BOARD = {'h8' => nil, 'h2' => nil, 'h3' => nil, 'h1' => 'wr', 'h6' => nil, 'h7' => 'wp', 'h4' => nil, 'h5' => nil, 'd8' => 'bq', 'a8' => 'br', 'd6' => nil, 'd7' => 'bp', 'd4' => nil, 'd5' => nil, 'd2' => 'wp', 'd3' => nil, 'd1' => 'wq', 'g7' => 'bp', 'g6' => nil, 'g5' => 'wp', 'g4' => nil, 'g3' => nil, 'g2' => nil, 'g1' => nil, 'g8' => 'bn', 'c8' => 'bb', 'c3' => 'bn', 'c2' => 'wp', 'c1' => 'wb', 'c7' => 'bp', 'c6' => nil, 'c5' => nil, 'c4' => nil, 'f1' => 'wb', 'f2' => 'wp', 'f3' => nil, 'f4' => nil, 'f5' => 'bp', 'f6' => nil, 'f7' => nil, 'f8' => 'bb', 'b4' => nil, 'b5' => nil, 'b6' => nil, 'b7' => 'bp', 'b1' => 'wn', 'b2' => 'wp', 'b3' => nil, 'b8' => nil, 'a1' => 'wr', 'a3' => nil, 'a2' => 'wp', 'a5' => nil, 'e8' => 'bk', 'a7' => 'bp', 'a6' => nil, 'e5' => nil, 'e4' => 'wn', 'e7' => 'bp', 'e6' => nil, 'e1' => 'wk', 'e3' => nil, 'e2' => 'wp', 'a4' => nil}


describe Piece do
    describe '#expand' do
        it 'returns list of possible moves for each white pawn from initial board' do
            97.upto(104) do |file|
                piece = Piece.new 'w','p', file.chr+'2'
                piece.expand(PLAIN_BOARD).collect { |move| move[:notation] }.sort.should eq [file.chr + '3', file.chr + '4']
            end
        end

        it 'returns list of possible moves for pawn from specific position' do
            #pawn capture right
            piece = Piece.new 'w','p', 'b2'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['b4', 'b3', 'bxc3'].sort
        end
    end

    # test_simple_expand_white_pawns(self):
 #        self.zboard.initialset()
 #        rezlist = []
 #        for p in self.zboard.whites:
 #            if p.type=='p':
 #                rezlist.append((repr(p),p.expand(self.zboard.board)))

 #        goallist = [( 'wp@a2' , ['a4', 'a3'] ),
 #                    ( 'wp@b2' , ['b4', 'b3'] ),
 #                    ( 'wp@c2' , ['c4', 'c3'] ),
 #                    ( 'wp@d2' , ['d4', 'd3'] ),
 #                    ( 'wp@e2' , ['e4', 'e3'] ),
 #                    ( 'wp@f2' , ['f4', 'f3'] ),
 #                    ( 'wp@g2' , ['g4', 'g3'] ),
 #                    ( 'wp@h2' , ['h4', 'h3'] ),]
 #        #print('goal:',goallist)
 #        #print('rez :',rezlist)
 #        self.assertEqual(goallist,rezlist)

    # def test_expand_pawns_knights(self):
 #        self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': 'wp', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bp', 'd4': '  ', 'd5': '  ', 'd2': 'wp', 'd3': '  ', 'd1': 'wq', 'g7': 'bp', 'g6': '  ', 'g5': 'wp', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': 'wp', 'c1': 'wb', 'c7': 'bp', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': 'wp', 'f3': '  ', 'f4': '  ', 'f5': 'bp', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': 'wn', 'b2': 'wp', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': 'bk', 'a7': 'bp', 'a6': '  ', 'e5': '  ', 'e4': 'wn', 'e7': 'bp', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': 'wp', 'a4': '  '})

 #        #pawn capture right
 #        self.assertEqual(set(['b4', 'b3', 'bxc3']),set(self.zboard.piece_by_sq('b2').expand(self.zboard.board)))
 #        #pawn capture right
 #        self.assertEqual(set(['d4', 'd3', 'dxc3']),set(self.zboard.piece_by_sq('d2').expand(self.zboard.board)))
 #        #blocked pawn
 #        self.assertEqual([],self.zboard.piece_by_sq('c2').expand(self.zboard.board))
 #        self.assertEqual(['e3'],self.zboard.piece_by_sq('e2').expand(self.zboard.board))
 #        #en passant no lastmove match, then with lastmovematch
 #        self.assertEqual(['g6'],self.zboard.piece_by_sq('g5').expand(self.zboard.board,self.zboard.lastmove))
 #        self.zboard.lastmove = 'f5'
 #        self.assertEqual(set(['g6','gxf6']),set(self.zboard.piece_by_sq('g5').expand(self.zboard.board,self.zboard.lastmove)))
 #        #promote pawn h7
 #        self.assertEqual(set(['h8R','h8N','h8B','h8Q','hxg8R','hxg8N','hxg8B','hxg8Q']),set(self.zboard.piece_by_sq('h7').expand(self.zboard.board,self.zboard.lastmove)))

 #        #knight at e4
 #        self.assertEqual(set(['Nf6','Ng3','Nxc3','Nc5','Nd6']),set(self.zboard.piece_by_sq('e4').expand(self.zboard.board)))
 #        #knight at c3
 #        self.assertEqual(set(['Nd5','Nxe4','Nxe2','Nxd1','Nxb1','Nxa2','Na4','Nb5']),set(self.zboard.piece_by_sq('c3').expand(self.zboard.board)))

 #    def test_add(self):
 #        self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': 'wp', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bp', 'd4': '  ', 'd5': '  ', 'd2': 'wp', 'd3': '  ', 'd1': 'wq', 'g7': 'bp', 'g6': '  ', 'g5': 'wp', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': 'wp', 'c1': 'wb', 'c7': 'bp', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': 'wp', 'f3': '  ', 'f4': '  ', 'f5': 'bp', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': '  ', 'b6': '  ', 'b7': 'bp', 'b1': 'wn', 'b2': 'wp', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': 'wp', 'a5': '  ', 'e8': 'bk', 'a7': 'bp', 'a6': '  ', 'e5': '  ', 'e4': 'wn', 'e7': 'bp', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': 'wp', 'a4': '  '})
 #        for p in self.zboard.fullset():
 #            if p.type == 'p':
 #                self.zboard.take(p)

 #        self.zboard.add('w','b','b5')
 #        self.zboard.add('bq@e5')
 #        self.zboard.add('bb@d7')
 #        self.zboard.add('wr@b7')
 #        #self.zboard.boardify()
 #        #print(self.zboard.board)
 #        self.assertEqual('wb@b5',repr(self.zboard.piece_by_sq('b5')))
 #        self.assertEqual('bq@e5',repr(self.zboard.piece_by_sq('e5')))
 #        self.assertEqual('bb@d7',repr(self.zboard.piece_by_sq('d7')))
 #        self.assertEqual('wr@b7',repr(self.zboard.piece_by_sq('b7')))

 #    def test_expand_bishop_rook_queen_king(self):
 #        self.zboard.piecefy({'h8': '  ', 'h2': '  ', 'h3': '  ', 'h1': 'wr', 'h6': '  ', 'h7': '  ', 'h4': '  ', 'h5': '  ', 'd8': 'bq', 'a8': 'br', 'd6': '  ', 'd7': 'bb', 'd4': '  ', 'd5': '  ', 'd2': '  ', 'd3': '  ', 'd1': 'wq', 'g7': '  ', 'g6': '  ', 'g5': '  ', 'g4': '  ', 'g3': '  ', 'g2': '  ', 'g1': '  ', 'g8': 'bn', 'c8': 'bb', 'c3': 'bn', 'c2': '  ', 'c1': 'wb', 'c7': '  ', 'c6': '  ', 'c5': '  ', 'c4': '  ', 'f1': 'wb', 'f2': '  ', 'f3': '  ', 'f4': '  ', 'f5': '  ', 'f6': '  ', 'f7': '  ', 'f8': 'bb', 'b4': '  ', 'b5': 'wb', 'b6': '  ', 'b7': 'wr', 'b1': 'wn', 'b2': '  ', 'b3': '  ', 'b8': '  ', 'a1': 'wr', 'a3': '  ', 'a2': '  ', 'a5': '  ', 'e8': 'bk', 'a7': '  ', 'a6': '  ', 'e5': 'bq', 'e4': 'wn', 'e7': '  ', 'e6': '  ', 'e1': 'wk', 'e3': '  ', 'e2': '  ', 'a4': '  '})
 #        #print('\n'+self.zboard.show())

 #        """
 #        |br|  |bb|bq|bk|bb|bn|  |
 #        |  |wr|  |bb|  |  |  |  |
 #        |  |  |  |  |  |  |  |  |
 #        |  |wb|  |  |bq|  |  |  |
 #        |  |  |  |  |wn|  |  |  |
 #        |  |  |bn|  |  |  |  |  |
 #        |  |  |  |  |  |  |  |  |
 #        |wr|wn|wb|wq|wk|wb|  |wr|
 #        """

 #        #for sq in ['b5','c8','d7','c1','a8','b7','e5','d1','e8','e1']:
 #        #    p = self.zboard.piece_by_sq(sq)
 #        #    print(p,p.expand(self.zboard.board))

 #        #white bishop at b5
 #        self.assertEqual(set(['Ba4', 'Ba6', 'Bc6','Bxd7','Bc4','Bd3','Be2']),set(self.zboard.piece_by_sq('b5').expand(self.zboard.board)))
 #        #bishop at c8
 #        self.assertEqual(['Bxb7'],self.zboard.piece_by_sq('c8').expand(self.zboard.board))
 #        #bishop at d7
 #        self.assertEqual(set(['Bc6', 'Bxb5', 'Be6','Bf5','Bg4','Bh3']),set(self.zboard.piece_by_sq('d7').expand(self.zboard.board)))
 #        #bishop at c1
 #        self.assertEqual(set(['Ba3', 'Bb2', 'Bd2','Be3','Bf4','Bg5','Bh6']),set(self.zboard.piece_by_sq('c1').expand(self.zboard.board)))

 #        #rook at a8
 #        self.assertEqual(set(['Rxa1', 'Ra2', 'Ra3','Ra4','Ra5','Ra6','Ra7','Rb8']),set(self.zboard.piece_by_sq('a8').expand(self.zboard.board)))
 #        #rook at b7
 #        self.assertEqual(set(['Rb6', 'Rc7', 'Rxd7','Rb8','Ra7']),set(self.zboard.piece_by_sq('b7').expand(self.zboard.board)))

 #        #queen at e5
 #        self.assertEqual(set(['Qe7', 'Qe6', 'Qf6','Qg7','Qh8','Qf5', 'Qg5', 'Qh5','Qf4','Qg3','Qh2', 'Qxe4', 'Qd4','Qd5','Qc5','Qxb5', 'Qd6','Qc7','Qb8',]),set(self.zboard.piece_by_sq('e5').expand(self.zboard.board)))
 #        #queen at d1
 #        self.assertEqual(set(['Qc2', 'Qb3', 'Qa4','Qd2','Qd3','Qd4', 'Qd5', 'Qd6','Qxd7','Qe2','Qf3', 'Qg4', 'Qh5']),set(self.zboard.piece_by_sq('d1').expand(self.zboard.board)))

 #        #king at e8
 #        self.assertEqual(set(['Ke7', 'Kf7']),set(self.zboard.piece_by_sq('e8').expand(self.zboard.board)))
 #        #king at e1
 #        self.assertEqual(set(['Kd2', 'Kf2', 'Ke2']),set(self.zboard.piece_by_sq('e1').expand(self.zboard.board)))


end

