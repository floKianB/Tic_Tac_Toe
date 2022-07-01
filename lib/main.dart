import 'package:flutter/material.dart';

void main() {
  runApp(TicTacToe());
}

class TicTacToe extends StatefulWidget {
  TicTacToe({Key? key}) : super(key: key);

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
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
                flex: 2,
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/X.png', width: 50),
                          SizedBox(height: 5),
                          Text("3 Wins",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff8FC23E),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/O.png', width: 50),
                          SizedBox(height: 5),
                          Text("2 Wins",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff5D79BC),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/D.png', width: 50),
                          SizedBox(height: 5),
                          Text("5 Draws",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Color(0xffE4EAF8),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                )
              ),




              // MAIN BOARD
              Expanded(
                flex: 6,
                child: Container(
                  
                )
              ),



              // TURN
              Expanded(
                flex: 2,
                child: Container(
                  
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}