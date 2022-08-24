
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../network/local/cache_helper.dart';
import 'states.dart';
import 'package:shop_app/shared/network/remote/dio.dart';




class AppCubit extends Cubit<NewsStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  bool isDark = true;

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(

        icon: Icon(Icons.business_center),
        label: "Business",
        backgroundColor: Colors.white),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Sports",),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: "Science",),
    BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings",),
  ];
  List<Widget> screens = [

  ];

  void changeNavBar(value) {
    currentIndex = value;
    emit(AppBottomNavBarState());
  }

  void darkMode({bool? fromshared}) {
    if (fromshared != null) {
      isDark = fromshared;
      emit(NewDarkModeState());
    }
    else {
      isDark = !isDark;
      CacheHelper.setBoolen(key: 'isDark', value: isDark);
      emit(NewDarkModeState());
    }
  }

  List<dynamic> business = [];

  void getBusniess() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'business',
          'apiKey': 'c81f973e7faf471d83d516843db173c0'
        }).then((value) {
      business = value.data['articles'];
      emit(NewsGetBusinessSuccessState());
    }).catchError((error) {
      emit(NewsGetBusinessErrorState(error.toString()));
    });
  }

  List<dynamic> Sports = [];

  void getSports() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': 'c81f973e7faf471d83d516843db173c0'
        }).then((value) {
      Sports = value.data['articles'];
      emit(NewsGetSportsSuccessState());
    }).catchError((error) {
      emit(NewsGetSportsErrorState(error.toString()));
    });
  }

  List <dynamic> Science = [];

  void getScience() {
    dioHelper.getData(
        path: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': 'c81f973e7faf471d83d516843db173c0'
        }).then((value) {
      Science = value.data['articles'];
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      emit(NewsGetScienceErrorState(error.toString()));
    });
  }

  List<dynamic> search = [];

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());

    dioHelper.getData(
      path: 'v2/everything',
      query:
      {
        'q': '$value',
        'apiKey': 'c81f973e7faf471d83d516843db173c0',
      },
    ).then((value) {
      //print(value.data['articles'][0]['title']);
      search = value.data['articles'];
      print(search[0]['title']);

      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}