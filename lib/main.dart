import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teqexpert_assingnment/core/Theme/theme_logic_extension/theme_provider.dart';
import 'package:teqexpert_assingnment/core/services/injector.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/cubit/user_cubit/user_cubit.dart';
import 'package:teqexpert_assingnment/features/userdata/presention/page/user_data_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
   await ThemeManager().init();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<UserCubit>(create: (context) => getIt<UserCubit>())
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ThemeManager().themeNotifier, 
      builder: (context, value, child) {
        return MaterialApp(
          theme: value,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const UserScreen(),
    );
      },);
  }
}
