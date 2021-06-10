import '../styles/dimensions.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: AppBar(
        title: Text(
          'Dice Roller App',
        ),
        centerTitle: true,
      ),
      body: GridView.count(
        padding: EdgeInsets.all(
          Dimension.gridViewPadding,
        ),
        crossAxisCount: Dimension.gridViewCrossAxisCount,
        crossAxisSpacing: Dimension.gridViewCrossAxisSpacing,
        mainAxisSpacing: Dimension.gridViewMainAxisSpacing,
        childAspectRatio: Dimension.gridViewChildAspectRatio,
        children: List.generate(
          Dimension.diceCount,
          (index) {
            return _generateListOfDices(
              index + 1,
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: Dimension.borderSideWidth,
              color: Colors.red,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tap any dice to roll it",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimension.leftTextStyleFontSize,
                height: Dimension.textStyleHeight,
              ),
            ),
            SizedBox(
              width: Dimension.bottomNavBarSizedBox,
            ),
            Text(
              "Your score is: 21",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Dimension.scoreNavBarFontSize,
                height: Dimension.textStyleHeight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _generateListOfDices(int diceNumber) {
    return Image(
      image: AssetImage(
        "assets/images/dice$diceNumber.png",
      ),
    );
  }
}
