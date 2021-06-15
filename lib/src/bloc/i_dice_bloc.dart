import 'contract/i_bloc.dart';

abstract class IDiceBloc extends IBloc {
  Stream<List<int>> get streamValue;

  Stream<String> get streamDicesScore;

  void roll();
}
