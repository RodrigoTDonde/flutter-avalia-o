import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int playerScore = 0;
  int opponentScore = 0;
  String opponentMove = '?';
  String roundResult = '';

  String _generateOpponentMove() {
    List<String> moves = ['Pedra', 'Papel', 'Tesoura'];
    int randomIndex = Random().nextInt(3);
    return moves[randomIndex];
  }

  void _playerChoice(String playerMove) {
    String opponentMove = _generateOpponentMove();

    setState(() {
      this.opponentMove = opponentMove;
      if (playerMove == opponentMove) {
        roundResult = 'Empate!';
      } else if ((playerMove == 'Pedra' && opponentMove == 'Tesoura') ||
          (playerMove == 'Tesoura' && opponentMove == 'Papel') ||
          (playerMove == 'Papel' && opponentMove == 'Pedra')) {
        playerScore++;
        roundResult = 'Você venceu!';
      } else {
        opponentScore++;
        roundResult = 'Computador venceu!';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pedra - Papel - Tesoura'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sua jogada',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  _playerChoice('Pedra');
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                        'Pedra',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _playerChoice('Papel');
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                        'Papel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _playerChoice('Tesoura');
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    shape: BoxShape.circle,
                  ),
                  width: 100,
                  height: 100,
                  child: Center(
                      child: Text(
                        'Tesoura',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                ),
              ),
            ],
          ),
          SizedBox(height: 50),
          Text(
            'Jogada do computador',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30),
          Container(
            margin: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.circle,
            ),
            width: 100,
            height: 100,
            child: Center(
                child: Text(
                  opponentMove,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                )),
          ),

          SizedBox(height: 40),
          Text(
            roundResult,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: 40,
        color: Colors.grey,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Você: $playerScore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'PC: $opponentScore',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

