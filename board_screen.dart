import 'package:flutter/material.dart';
import 'package:tic_toe_app/board_header.dart';
import 'package:tic_toe_app/buttons.dart';

class BoardScreen extends StatefulWidget {
  static const String routeName = "Board";

  @override
  State<BoardScreen> createState() => _BoardScreenState();
}

class _BoardScreenState extends State<BoardScreen> {
  int counter=0;

  List<String> boardStatus = [
    '','','',
    '','','',
    '','','',
  ];

  String currentPlayer='X';

  String player1 ='X';

  String playerTurn='X turn';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe App", textAlign: TextAlign.center,),
        ),
      body: Column(
        children: [
          Expanded(child: BoardHeader(playerTurn)),

          Expanded(
            child: Row(
              children: [
                BoardButtons(boardStatus[0], onbtnClick,0),
                BoardButtons(boardStatus[1], onbtnClick,1),
                BoardButtons(boardStatus[2], onbtnClick,2),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BoardButtons(boardStatus[3], onbtnClick,3),
                BoardButtons(boardStatus[4], onbtnClick,4),
                BoardButtons(boardStatus[5], onbtnClick,5),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                BoardButtons(boardStatus[6], onbtnClick,6),
                BoardButtons(boardStatus[7], onbtnClick,7),
                BoardButtons(boardStatus[8], onbtnClick,8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void onbtnClick(int index){
    if(currentPlayer=='X'){
      boardStatus[index]='X';
      currentPlayer='O';
      playerTurn ='O turn';
    }else{
      boardStatus[index]='O';
      currentPlayer='X';
      playerTurn ='X turn';
    }
    setState(() {});
    counter++;
    boardChecker(currentPlayer);
    winnerChecker();
    }

    void winnerChecker(){
      if (boardChecker(currentPlayer)== true){
        print('$currentPlayer WON');
        playerTurn ='$currentPlayer WON ';
        boardStatus = [ '','','',  '','','',  '','','', ];
        counter=0;
      } else if (counter==9){
        boardStatus = [ '','','',  '','','',  '','','', ];
        print("no one wins");
        counter=0;
      }
    }

    bool boardChecker(String userCheck){
    for(int i=0; i<3; i++){ //0-3-6 ** 1-4-7 ** 2-5-8
      if (boardStatus[i] == userCheck
      && boardStatus[i+3] == userCheck
      && boardStatus[i+6] == userCheck){
        return true;
      }
    }
    for(int i=0; i<9; i+=3){ //0-1-2 ** 3-4-5 ** 6-7-8
      if (boardStatus[i]== userCheck
          && boardStatus[i+1] == userCheck
          && boardStatus[i+2] == userCheck){
        return true;
      }
    }
    if (boardStatus[0]== userCheck
        && boardStatus[4] == userCheck
        && boardStatus[8] == userCheck){
      return true;
    }else if (boardStatus[2]== userCheck
        && boardStatus[4] == userCheck
        && boardStatus[6] == userCheck){
      return true;
    }
    return false;
    }
}
