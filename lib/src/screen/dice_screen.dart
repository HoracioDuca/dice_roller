import '../bloc/i_dice_bloc.dart';
import '../styles/dimensions.dart';
import 'package:flutter/material.dart';

class DiceScreen extends StatefulWidget {
  DiceScreen({
    @required this.diceBloc,
    @required this.title,
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
          Dimension.appBarTitle,
        ),
        centerTitle: true,
      ),
      body: StreamBuilder(
        initialData: Dimension.initialDices,
        stream: widget.diceBloc.streamValue,
        builder: (
          context,
          snapshot,
        ) {
          return GridView.count(
            padding: EdgeInsets.all(
              Dimension.gridViewPadding,
            ),
            crossAxisCount: Dimension.gridViewCrossAxisCount,
            crossAxisSpacing: Dimension.gridViewCrossAxisSpacing,
            mainAxisSpacing: Dimension.gridViewMainAxisSpacing,
            childAspectRatio: Dimension.gridViewChildAspectRatio,
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
              width: Dimension.borderSideWidth,
              color: Colors.red,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Dimension.bottomNavBarSizedBoxWeight,
            ),
            Text(
              Dimension.makeItRollText,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: Dimension.leftTextStyleFontSize,
                height: Dimension.textStyleHeight,
              ),
            ),
            SizedBox(
              width: Dimension.bottomNavBarSizedBoxWeight,
            ),
            Text(
              Dimension.scoreText,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Dimension.scoreNavBarFontSize,
                height: Dimension.textStyleHeight,
              ),
            ),
            StreamBuilder(
              initialData: Dimension.initialScore,
              stream: widget.diceBloc.streamDicesScore,
              builder: (
                context,
                snapshot,
              ) {
                return Text(
                  snapshot.data,
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: Dimension.scoreNavBarFontSize,
                    fontWeight: FontWeight.bold,
                    height: Dimension.textStyleHeight,
                  ),
                );
              },
            ),
            SizedBox(
              width: Dimension.bottomNavBarSizedBoxWeight,
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
                Dimension.imagePath + '$diceFace' + Dimension.imageExtension,
              ),
            ),
          ),
        );
      },
    );
    return diceContainer.toList();
  }
}
