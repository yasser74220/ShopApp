import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/modules/onboarding.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/observer.dart';
import 'package:shop_app/shared/cubit/states.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/network/remote/dio.dart';
import 'package:shop_app/styles/themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  dioHelper.init();
  await CacheHelper.init();

  bool? isDark = CacheHelper.getBoolen(key: 'isDark');
  runApp(MyApp(isDark));}

class MyApp extends StatelessWidget {
   var isDark;

  MyApp(this.isDark);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()
        ..getBusniess()
        ..getScience()
        ..getSports()
        ..darkMode(fromshared: isDark),
      child: BlocConsumer<AppCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // AppCubit cubit = AppCubit.get(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: light,
            darkTheme: dark,
            themeMode:
             AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home:  OnBoardingScreen(),
          );
        },
      ),
    );
  }
}
