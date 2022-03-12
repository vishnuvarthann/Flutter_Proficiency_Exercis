import 'package:continental_poc/Model/model_data.dart';
import 'package:equatable/equatable.dart';

abstract class TodocubitState extends Equatable {
  const TodocubitState();

  @override
  List<Object> get props => [];
}

class TodocubitInitial extends TodocubitState {}

class TodoLoaded extends TodocubitState {
  final List<JsonData> data;
  const TodoLoaded({required this.data});
}

class TodoError extends TodocubitState {
  final String message;
  const TodoError({required this.message});
}
