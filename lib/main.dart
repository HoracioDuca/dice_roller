import 'src/styles/dimensions.dart';
import 'package:flutter/material.dart';
import 'src/bloc/dice_bloc.dart';
import 'src/screen/dice_screen.dart';

void main() {
  runApp(DiceRoller());
}

class DiceRoller extends StatefulWidget {
  @override
  _DiceRollerState createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  @override
  void initState() {
    super.initState();
  }

  final DiceBloc diceBloc = DiceBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Dimension.mainAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: DiceScreen(
        diceBloc: this.diceBloc,
        title: Dimension.mainAppTitle,
      ),
    );
  }
}
