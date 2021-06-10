import 'package:flutter/material.dart';
import 'src/screen/ui_dice.dart';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roll the Dice App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiceScreen(),
    );
  }
}
