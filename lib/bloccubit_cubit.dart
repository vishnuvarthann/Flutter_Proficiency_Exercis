import 'package:continental_poc/Bloc/bloccubit_state.dart';
import 'package:continental_poc/Model/model_data.dart';
import 'package:continental_poc/blocrepositoryImpl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodocubitCubit extends Cubit<TodocubitState> {
  final TodoRepository _todoRepository;

  TodocubitCubit(this._todoRepository) : super(TodocubitInitial());

  Future<void> getData() async {
    try {
      List<JsonData> data = await _todoRepository.fetchData();
      emit(TodoLoaded(data: data));
    } on Exception {
      // emit(const TodoError("message: Error(e)");
      emit(const TodoError(
          message: "Could not fetch the list, please try again later!"));
    }
  }
}
