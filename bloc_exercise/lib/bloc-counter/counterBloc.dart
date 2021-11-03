//import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counterbloc_state.dart';

class CounterBloc extends Cubit<int> {
  CounterBloc() : super(0);

  void incrementCount() {
    emit(state + 1);
  }
}
