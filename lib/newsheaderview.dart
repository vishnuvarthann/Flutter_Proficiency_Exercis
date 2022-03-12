import 'package:continental_poc/Bloc/bloccubit_state.dart';
import 'package:continental_poc/EnvUrl/env.dart';
import 'package:continental_poc/bloccubit_cubit.dart';
import 'package:continental_poc/common/colors.dart';
import 'package:continental_poc/common/dime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsHeaderView extends StatelessWidget {
  const NewsHeaderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.vbackground,
      appBar: AppBar(
        backgroundColor: AppColors.vheader,
        title: Center(
          child: Text(
            EnvironmentConstant.headline,
            style: TextStyle(
                color: AppColors.vheaderfont,
                fontSize: DimensionValue.fontSize29),
          ),
        ),
      ),
      body: Center(child: BlocBuilder<TodocubitCubit, TodocubitState>(
        builder: (context, state) {
          if (state is TodocubitInitial) {
            context.read<TodocubitCubit>().getData();
            return showLoader();
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                      title: Text(state.data[index].title.toString() + "")),
                );
              },
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      )),
    );
  }

  Widget showLoader() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
