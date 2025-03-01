import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teqexpert_assingnment/core/services/injector.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/cubit/user_cubit/user_cubit.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/page/user_data_view.dart';

void main() {
  configureDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: UserScreen(),
    );
  }
}
