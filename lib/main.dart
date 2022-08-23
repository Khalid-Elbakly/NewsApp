import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:newsapp/shared/bloc_observer.dart';
import 'package:newsapp/shared/cubit/cubit.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';
import 'package:newsapp/shared/network/remote/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'layout/news_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  bool fromShared;
  await CacheHelper.init();
  Bloc.observer = MyBlocObserver();
  fromShared = CacheHelper.getBooleon("isDark");
  runApp(MyApp(fromShared));
}

class MyApp extends StatelessWidget {
  final isDark;
  MyApp(this.isDark);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getBusinessData()..ChangeMode(fromShared: isDark),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder:(context,state) => MaterialApp(
          home: NewsLayout(
          ),
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
              ),
              backgroundColor: Colors.white,
                elevation: 0,
              titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            iconTheme: IconThemeData(color: Colors.black)
            ),
              textTheme: TextTheme(bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.black)),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepOrange,
              elevation: 20.0
            ),
            primaryColor: Colors.deepOrange
          ),
          darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch: Colors.deepOrange,
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  backgroundColor: HexColor('333739'),
                  elevation: 20,
                  titleTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  iconTheme: IconThemeData(color: Colors.white)
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.grey,
                  elevation: 20.0,
                backgroundColor: HexColor('333739')
              ),
              primaryColor: Colors.deepOrange,
            textTheme: TextTheme(bodyText1: TextStyle(fontWeight: FontWeight.bold, fontSize: 18,color: Colors.white)),
          ),
          themeMode: AppCubit.get(context).isDark? ThemeMode.dark : ThemeMode.light,
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
