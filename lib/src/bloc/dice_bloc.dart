import 'dart:async';
import 'dart:math';
import '../styles/constants.dart';
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
  void initialize() {}

  @override
  void roll() {
    this._diceValues.clear();
    int _score = 0;
    int _randomValue;
    for (int i = 0; i < Constants.diceCount; i++) {
      _randomValue = Random().nextInt(Constants.diceFaces) + 1;
      this._diceValues.add(_randomValue);
      _score += _randomValue;
    }
    this._streamValueController.sink.add(this._diceValues);
    this._streamDicesScoreController.sink.add('$_score');
  }

  @override
  Stream<List<int>> get streamValue => _streamValueController.stream;

  @override
  Stream<String> get streamDicesScore => _streamDicesScoreController.stream;
}
