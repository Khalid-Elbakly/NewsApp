import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsapp/modules/business/business_screen.dart';
import 'package:newsapp/shared/cubit/states.dart';
import 'package:newsapp/shared/network/local/cache_helper.dart';

import '../../modules/science/science_screen.dart';
import '../../modules/settings/settings_screen.dart';
import '../../modules/sports/sports_screen.dart';
import '../network/remote/dio_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: "Business"),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports"),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science"),
  ];

  var CurrentIndex = 0;

  void onTapBottomNav(index) {
    CurrentIndex = index;
    if (index == 1)
      getSportsData();
    if (index == 2)
      getScienceData();
    emit(AppBottomNavState());
  }

  List<Widget> screens = [
    BuisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];

  List<dynamic> business = [];

  void getBusinessData() {
    emit(LoadingBusinessState());
    DioHelper.getData("/v2/top-headlines", {
      "country": "eg",
      "category": "business",
      "apiKey": "48283ee9bf36467c8f671e64ecf0f836",
    }).then((value) {
      business = value.data['articles'];
      print(business[0]['title']);
      print(business.length);
      emit(BusinessSuccessState());
    }).catchError((error) {
      print(error);
      emit(BusinessErrorState(error.toString()));
    });
  }

  List<dynamic> sports = [];

  void getSportsData() {
    emit(LoadingSportsState());
    DioHelper.getData("/v2/top-headlines", {
      "country": "eg",
      "category": "sports",
      "apiKey": "48283ee9bf36467c8f671e64ecf0f836",
    }).then((value) {
      sports = value.data['articles'];
      emit(SportsSuccessState());
    }).catchError((error) {
      print(error);
      emit(SportsErrorState(error.toString()));
    });
  }

  List<dynamic> science = [];

  void getScienceData() {
    emit(LoadingScienceState());
    DioHelper.getData("/v2/top-headlines", {
      "country": "eg",
      "category": "science",
      "apiKey": "48283ee9bf36467c8f671e64ecf0f836",
    }).then((value) {
      science = value.data['articles'];
      emit(ScienceSuccessState());
    }).catchError((error) {
      print(error);
      emit(ScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearchData(String value) {
    emit(LoadingSearchState());
    // search = [];
    DioHelper.getData("/v2/everything", {
      "q": "$value",
      "apiKey": "48283ee9bf36467c8f671e64ecf0f836",
    }).then((value) {
      search = value.data['articles'];
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error);
      emit(SearchErrorState(error.toString()));
    });
  }

  bool isDark = false;

  void ChangeMode({var fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(ChangeModeState());
    } else {
      isDark = !isDark;
      CacheHelper.PutBooleon('isDark', isDark).then((value) =>
          emit(ChangeModeState()));
    }
  }
}