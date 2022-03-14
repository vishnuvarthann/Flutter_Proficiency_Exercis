import 'package:continental_poc/Model/CountriesResponse.dart';
import 'package:continental_poc/Model/model_data.dart';
import 'package:equatable/equatable.dart';

abstract class TodoState extends Equatable {
  const TodoState();

  @override
  List<Object> get props => [];
}

class TodoInitial extends TodoState {}

class TodoLoaded extends TodoState {
  final List<CountriesResponse> data;
  const TodoLoaded({required this.data});
}

class TodoError extends TodoState {
  final String message;
  const TodoError({required this.message});
}
