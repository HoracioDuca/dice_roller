import '../bloc/i_dice_bloc.dart';
import '../styles/constants.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    required this.diceBloc,
    required this.title,
  });

  final IDiceBloc diceBloc;
  final String title;

  @override
  _DiceScreenState createState() => _DiceScreenState();
}

class _DiceScreenState extends State<DiceScreen> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(
          Constants.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: Constants.initialDices,
        stream: widget.diceBloc.streamValue,
        builder: (
          context,
          snapshot,
        ) {
          return GridView.count(
            padding: EdgeInsets.all(
              Constants.gridViewPadding,
            ),
            crossAxisCount: Constants.gridViewCrossAxisCount,
            crossAxisSpacing: Constants.gridViewCrossAxisSpacing,
            mainAxisSpacing: Constants.gridViewMainAxisSpacing,
            childAspectRatio: Constants.gridViewChildAspectRatio,
            children: _generateDiceContainer(
              snapshot,
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: Constants.borderSideWidth,
              color: Colors.red,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Constants.bottomNavBarSizedBoxWeight,
            ),
            Text(
              Constants.makeItRollText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Constants.leftTextStyleFontSize,
                height: Constants.textStyleHeight,
              ),
            ),
            SizedBox(
              width: Constants.bottomNavBarSizedBoxWeight,
            ),
            Text(
              Constants.scoreText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Constants.scoreNavBarFontSize,
                height: Constants.textStyleHeight,
              ),
            ),
            StreamBuilder(
              initialData: Constants.initialScore,
              stream: widget.diceBloc.streamDicesScore,
              builder: (
                context,
                snapshot,
              ) {
                return Text(
                  snapshot.data.toString(),
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: Constants.scoreNavBarFontSize,
                    fontWeight: FontWeight.bold,
                    height: Constants.textStyleHeight,
                  ),
                );
              },
            ),
            SizedBox(
              width: Constants.bottomNavBarSizedBoxWeight,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _generateDiceContainer(AsyncSnapshot snapshot) {
    var diceContainer = snapshot.data.map<Widget>(
      (
        diceFace,
      ) {
        return InkWell(
          onTap: () {
            widget.diceBloc.roll();
          },
          child: Container(
            child: Image(
              image: AssetImage(
                Constants.imagePath + '$diceFace' + Constants.imageExtension,
              ),
            ),
          ),
        );
      },
    );
    return diceContainer.toList();
  }
}
