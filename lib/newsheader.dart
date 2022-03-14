import 'package:continental_poc/CountryData.dart';
import 'package:continental_poc/bloccubit_cubit.dart';
import 'package:continental_poc/blocrepositoryImpl.dart';
import 'package:continental_poc/newsheaderview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodaysNews extends StatelessWidget {
  const TodaysNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Todays News",
      home: BlocProvider(
        create: (context) => TodocubitCubit(TodoRepositoryImpl()),
        child: const NewsHeaderView(),
      ),
    );
  }
}
