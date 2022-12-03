import 'package:flutter/material.dart';

class MyBird extends StatelessWidget {
  const MyBird({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 105,
      width: 105,
      child: Image.asset(
          'lib/images/flappybird.png'
      ),
    );
  }
}
