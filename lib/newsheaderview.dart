import 'package:cached_network_image/cached_network_image.dart';
import 'package:continental_poc/Bloc/bloccubit_state.dart';
import 'package:continental_poc/EnvUrl/env.dart';
import 'package:continental_poc/bloccubit_cubit.dart';
import 'package:continental_poc/blocrepositoryImpl.dart';
import 'package:continental_poc/common/appstyle.dart';
import 'package:continental_poc/common/colors.dart';
import 'package:continental_poc/common/dime.dart';
import 'package:continental_poc/service.dart';
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
              itemCount: state.data.rows?.length ?? 0,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    child: ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: state.data.rows![index].imageHref ?? "",
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) =>
                            CircularProgressIndicator(
                                value: downloadProgress.progress),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),

                  // leading: CachedNetworkImage(
                  //   imageUrl: state.data.rows![index].imageHref.,
                  //   placeholder: (context, url) =>
                  //       const CircularProgressIndicator(),
                  //   errorWidget: (context, url, error) =>
                  //       const Icon(Icons.error),
                  // ),
                  // leading: Image.network(
                  //     state.data.rows![index].imageHref ?? "",
                  //     height: 50,
                  //     width: 50,
                  //     ),
                  title: Text(
                    state.data.rows![index].title ?? "",
                    style: Styles.headerStyles,
                  ),
                  subtitle: Text(
                    state.data.rows![index].description ?? "",
                    style: Styles.headerStyles,
                  ),
                ));
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
