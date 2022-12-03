import 'dart:async';

import 'package:flutter/material.dart';
import 'bird.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double birdyaxis = 0;
  double time =0;
  double height =0;
  double initialheight = birdyaxis;
  bool gamehasstarted = false;
  void jump(){
    setState(() {
      time =0;
      initialheight = birdyaxis;
    });

  }
  void startGame(){
    gamehasstarted = true;
    Timer.periodic(const Duration(milliseconds: 50),(timer){
      time +=0.04;
      height = -4.9*time*time+2.8*time;
      setState(() {
        birdyaxis=initialheight - height;
      });
      if (birdyaxis>1){
        timer.cancel() ;
        gamehasstarted = false;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: (){
                if(gamehasstarted){
                  jump();
                }
                else{
                  startGame();
                }
              },
              child: AnimatedContainer(
                alignment: Alignment(0,birdyaxis),
                duration: const Duration(milliseconds: 0),
                color: Colors.blue,
                child: const MyBird(),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("SCORE", style: TextStyle(color: Colors.white, fontSize: 20)),
                      SizedBox(
                        height: 20,
                      ),
                      Text("0"),
                  ],
                ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text("BEST SCORE"),
                      Text("10"),
                  ],
                ),
              ],)
            ),
          ),
        ],
      ),
    );
  }
}
