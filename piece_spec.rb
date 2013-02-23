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
TEST2_BOARD = {'h8' => nil, 'h2' => nil, 'h3' => nil, 'h1' => 'wr', 'h6' => nil, 'h7' => nil, 'h4' => nil, 'h5' => nil, 'd8' => 'bq', 'a8' => 'br', 'd6' => nil, 'd7' => 'bb', 'd4' => nil, 'd5' => nil, 'd2' => nil, 'd3' => nil, 'd1' => 'wq', 'g7' => nil, 'g6' => nil, 'g5' => nil, 'g4' => nil, 'g3' => nil, 'g2' => nil, 'g1' => nil, 'g8' => 'bn', 'c8' => 'bb', 'c3' => 'bn', 'c2' => nil, 'c1' => 'wb', 'c7' => nil, 'c6' => nil, 'c5' => nil, 'c4' => nil, 'f1' => 'wb', 'f2' => nil, 'f3' => nil, 'f4' => nil, 'f5' => nil, 'f6' => nil, 'f7' => nil, 'f8' => 'bb', 'b4' => nil, 'b5' => 'wb', 'b6' => nil, 'b7' => 'wr', 'b1' => 'wn', 'b2' => nil, 'b3' => nil, 'b8' => nil, 'a1' => 'wr', 'a3' => nil, 'a2' => nil, 'a5' => nil, 'e8' => 'bk', 'a7' => nil, 'a6' => nil, 'e5' => 'bq', 'e4' => 'wn', 'e7' => nil, 'e6' => nil, 'e1' => 'wk', 'e3' => nil, 'e2' => nil, 'a4' => nil}


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
            #pawn capture right
            piece = Piece.new 'w','p', 'd2'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['d4', 'd3', 'dxc3'].sort
            #blocked pawn
            piece = Piece.new 'w','p', 'c2'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq []
            piece = Piece.new 'w','p', 'e2'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['e3']
            #en passant no lastmove match, then with lastmovematch
            piece = Piece.new 'w','p', 'g5'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['g6','gxf6']
            #promote pawn h7
            piece = Piece.new 'w','p', 'h7'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['h8R','h8N','h8B','h8Q','hxg8R','hxg8N','hxg8B','hxg8Q'].sort
        end

        it 'returns list of possible moves for knight from specific position' do
            #knight at e4
            piece = Piece.new 'w','n', 'e4'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['Nf6','Ng3','Nxc3','Nc5','Nd6'].sort
            #knight at c3
            piece = Piece.new 'b','n', 'c3'
            piece.expand(TEST1_BOARD).collect { |move| move[:notation] }.sort.should eq ['Nd5','Nxe4','Nxe2','Nxd1','Nxb1','Nxa2','Na4','Nb5'].sort
        end

        it 'returns list of possible moves for bishop, rook, queen and king from specific position' do
            # """
            # |br|  |bb|bq|bk|bb|bn|  |
            # |  |wr|  |bb|  |  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |  |wb|  |  |bq|  |  |  |
            # |  |  |  |  |wn|  |  |  |
            # |  |  |bn|  |  |  |  |  |
            # |  |  |  |  |  |  |  |  |
            # |wr|wn|wb|wq|wk|wb|  |wr|
            # """
            #white bishop at b5
            piece = Piece.new 'w','b', 'b5'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Ba4', 'Ba6', 'Bc6','Bxd7','Bc4','Bd3','Be2'].sort
            #bishop at c8
            piece = Piece.new 'b','b', 'c8'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Bxb7']
            #bishop at d7
            piece = Piece.new 'b','b', 'd7'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Bc6', 'Bxb5', 'Be6','Bf5','Bg4','Bh3'].sort
            #bishop at c1
            piece = Piece.new 'w','b', 'c1'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Ba3', 'Bb2', 'Bd2','Be3','Bf4','Bg5','Bh6'].sort

            #rook at a8
            piece = Piece.new 'b','r', 'a8'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Rxa1', 'Ra2', 'Ra3','Ra4','Ra5','Ra6','Ra7','Rb8'].sort
            #rook at b7
            piece = Piece.new 'w','r', 'b7'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Rb6', 'Rc7', 'Rxd7','Rb8','Ra7'].sort

            #queen at e5
            piece = Piece.new 'b','q', 'e5'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Qe7', 'Qe6', 'Qf6','Qg7','Qh8','Qf5', 'Qg5', 'Qh5','Qf4','Qg3','Qh2', 'Qxe4', 'Qd4','Qd5','Qc5','Qxb5', 'Qd6','Qc7','Qb8',].sort
            #queen at d1
            piece = Piece.new 'w','q', 'd1'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Qc2', 'Qb3', 'Qa4','Qd2','Qd3','Qd4', 'Qd5', 'Qd6','Qxd7','Qe2','Qf3', 'Qg4', 'Qh5'].sort

            #king at e8
            piece = Piece.new 'b','k', 'e8'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Ke7', 'Kf7']
            #king at e1
            piece = Piece.new 'w','k', 'e1'
            piece.expand(TEST2_BOARD).collect { |move| move[:notation] }.sort.should eq ['Kd2', 'Kf2', 'Ke2'].sort
        end
    end
end