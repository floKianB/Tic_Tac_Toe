import 'package:flutter/material.dart';

class ScoreBoard extends StatelessWidget {
  ScoreBoard({Key? key, int this.oWins = 0, int this.xWins = 0, int this.draws = 0}) : super(key: key);
  int oWins;
  int xWins;
  int draws;
  @override
  Widget build(BuildContext context) {
    return Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('images/X.png', width: 50),
                    SizedBox(height: 5),
                    Text("$xWins Wins",
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
                    Text("$oWins Wins",
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
                    Text("$draws Draws",
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
    );  
  }
}