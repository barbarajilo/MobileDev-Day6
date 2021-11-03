import 'package:bloc/bloc.dart';

class TextCapitalizer extends Cubit<String> {
  TextCapitalizer() : super('');

  void sizeIncrement(text) => emit(text.toUpperCase());
}
