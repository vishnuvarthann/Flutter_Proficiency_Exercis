// igno'package:continental_poc/bloc_state.dart'

import 'package:continental_poc/bloc_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInitial());
}
