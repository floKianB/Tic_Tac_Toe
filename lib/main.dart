import 'package:flutter/material.dart';
import 'package:tic_tac_toe/score_board.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatefulWidget {
  TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  bool turnO = true;
  int xWins = 0;
  int oWins = 0;
  int draws = 0;
  List<String> board = ['', '', '', '', '', '', '', '', '', ''];
  int numberOfMoves = 0;
  String? winner;

  @override
  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromARGB(255, 18, 16, 46),
      ),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [

              // SCORE BOARD 
              Expanded(
                flex: 3,
                child: ScoreBoard(oWins: oWins, xWins: xWins, draws: draws),
              ),

              // MAIN BOARD
              Expanded(
                flex: 6,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: GridView.builder(
                    itemCount: 9,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      String item = board[index];
                      String picSrc = "images/$item.png";
                      return GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(20),
                          margin: EdgeInsets.all(5),
                          child: Content(item, picSrc),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                        onTap:(){
                          if(winner != null){
                            return;
                          }
                            setState((){
                              if(turnO){
                                if(board[index] == ''){
                                  board[index] = 'O';
                                  numberOfMoves++;
                                  CheckForWinner();
                                  turnO = !turnO;
                                }
                              } else{
                                if(board[index] == ''){
                                  board[index] = 'X';
                                  numberOfMoves++;
                                  CheckForWinner();                                  
                                  turnO = !turnO;
                                }
                              }
                            });
                          } 
                          
                        
                        
                      );
                    },
                  ),
                )
              ),


              // TURN
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                      child: Text(
                        GameResult(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                        child: Icon(Icons.refresh, size: 60, color: Colors.red),
                        onTap:(){
                          ClearGame();
                        },
                      ),
                      SizedBox(height: 5),
                      Text(
                        turnO ? "Turn O" : "Turn X",
                        style: TextStyle(
                          color: turnO ? Color(0xff5D79BC) : Color(0xff8FC23E),
                          fontSize: 20,
                        ),
                      ),


                  ],
                ), 
                    
                ),
            ],
          ),
        ),
      ),
    );
  }

    Counter(int index){
      if(board[index] == 'X'){
        setState((){
          xWins++;
          winner = 'X';
        });
      } 
      if(board[index] == 'O'){
        setState((){
          oWins++;
          winner = 'O';
        });
      }
    }


    CheckForWinner(){
      // Horizontal Wins
      if(board[0] == board[1] && board[1] == board[2] && board[0] != 0){
        Counter(0);
        return;
      }
      if(board[3] == board[4] && board[4] == board[5] && board[3] != 0){
        Counter(3);
        return;
      }
      if(board[6] == board[7] && board[7] == board[8] && board[6] != 0){
        Counter(6);
        return;
      }
      //Vertical Wins
      if(board[0] == board[3] && board[3] == board[6] && board[0] != 0){
        Counter(0);
        return;
      }
      if(board[1] == board[4] && board[4] == board[7] && board[1] != 0){
        Counter(1);
        return;
      }
      if(board[2] == board[5] && board[5] == board[8] && board[2] != 0){
        Counter(2);
        return;
      }
      //Diagnol Wins
      if(board[0] == board[4] && board[4] == board[8] && board[0] != 0){
        Counter(0);
        return;
      }
      if(board[2] == board[4] && board[4] == board[6] && board[2] != 0){
        Counter(2);
        return;
      }
      //Draw situation
      else if(numberOfMoves == 9){
        setState((){
          draws++;
        });
        ClearGame();
      }
    }

    ClearGame(){
      setState((){
        board = ['', '', '', '', '', '', '', '', '', ''];
        numberOfMoves = 0;
        turnO = true;
        winner = null;
      });
    }


    String GameResult(){
      if(winner == 'X'){
        return "X is the Winner";
      }
      if(winner == 'O'){
        return "O is the Winner";
      }
      if(winner == ''){
        return "Draws, Player Again";
      }
      else{
        return "";
      }
    }

}





  Content(String item, String picSrc){
    if(item != '' && item == 'O' || item == 'X'){
      return(
        Image.asset("$picSrc")
      ); 
    }
  }


