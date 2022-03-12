import 'package:bloc/bloc.dart';
import 'package:continental_poc/newsheader.dart';
import 'package:flutter/material.dart';

import 'bloc_observer.dart';

void main() async {
  BlocOverrides.runZoned(
    () => runApp(const TodaysNews()),
    blocObserver: TodoBlocObserver(),
  );
}
