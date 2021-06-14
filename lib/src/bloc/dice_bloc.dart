import 'dart:async';
import 'dart:math';
import '../styles/dimensions.dart';
import 'i_dice_bloc.dart';

class DiceBloc extends IDiceBloc {
  List<int> _diceValues = [];
  StreamController<List<int>> _streamValueController =
      StreamController<List<int>>.broadcast();
  StreamController<String> _streamDicesScoreController =
      StreamController<String>.broadcast();

  @override
  void dispose() {
    _streamValueController.close();
    _streamDicesScoreController.close();
  }

  @override
  Future<void> initialize() {}

  @override
  void roll() {
    this._diceValues.clear();
    int score = 0;
    for (int i = 0; i < Dimension.diceCount; i++) {
      int randomValue = Random().nextInt(Dimension.diceFaces) + 1;
      this._diceValues.add(randomValue);
      score += randomValue;
    }
    this._streamValueController.sink.add(this._diceValues);
    this._streamDicesScoreController.sink.add('$score');
  }

  @override
  Stream<List<int>> get streamValue => _streamValueController.stream;

  @override
  Stream<String> get streamDicesScore => _streamDicesScoreController.stream;
}
