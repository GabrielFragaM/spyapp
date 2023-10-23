import 'package:flutter/material.dart';

void main() {
  runApp(MyChessBoardApp());
}

class MyChessBoardApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tabuleiro de Xadrez'),
        ),
        body: ChessBoard(),
      ),
    );
  }
}

class ChessPiece {
  final Color color;
  final String type;

  ChessPiece(this.color, this.type);
}

class ChessBoard extends StatefulWidget {
  @override
  _ChessBoardState createState() => _ChessBoardState();
}

class _ChessBoardState extends State<ChessBoard> {
  final List<List<Color>> boardColors = [
    [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
    [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
    [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
    [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
    [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
    [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
    [Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black],
    [Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white, Colors.black, Colors.white],
  ];

  List<List<ChessPiece?>> pieces = [
    [null, null, null, ChessPiece(Colors.white, 'Q'), null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, ChessPiece(Colors.white, 'P'), null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, null, null, null, null, null],
    [null, null, null, ChessPiece(Colors.black, 'P'), null, null, null, null],
  ];

  void _onCellTapped(int row, int col) {
    final piece = pieces[row][col];
    if (piece != null) {
      print('Clique na posição: $row, $col - Tipo de peça: ${piece.type}, Cor: ${piece.color}');
    } else {
      print('Clique na posição: $row, $col - Sem peça');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: buildChessBoard(),
      ),
    );
  }

  List<Widget> buildChessBoard() {
    List<Widget> board = [];

    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        final color = boardColors[row][col];

        final piece = GestureDetector(
          onTap: () {
            _onCellTapped(row, col);
          },
          child: Container(
            width: 40.0,
            height: 40.0,
            color: color,
            child: pieces[row][col] != null
                ? Center(
              child: Text(
                pieces[row][col]?.type ?? '',
                style: TextStyle(
                  color: pieces[row][col]?.color ?? Colors.white,
                  fontSize: 20.0,
                ),
              ),
            )
                : null,
          ),
        );

        board.add(Positioned(
          left: col * 40.0,
          top: row * 40.0,
          child: piece,
        ));
      }
    }

    return board;
  }
}
