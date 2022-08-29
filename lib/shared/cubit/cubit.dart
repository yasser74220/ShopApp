import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/loginmodel.dart';
import 'package:shop_app/modules/favorites.dart';
import 'package:shop_app/modules/settings.dart';
import 'package:shop_app/shared/network/end_points.dart';

import '../../modules/categories.dart';
import '../../modules/products.dart';
import '../components/components.dart';
import '../network/local/cache_helper.dart';
import 'states.dart';
import 'package:shop_app/shared/network/remote/dio.dart';


class AppCubit extends Cubit<ShopLoginStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  IconData suffix = Icons.visibility;
  bool isPassword = true;
  ShopLoginModel? loginModel;
  int currentIndex = 0;
  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  List<Widget> screens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavoritesScreen(),
    SettingScreen(),
  ];
  void changePasswordVisibility(){
    isPassword = !isPassword;

    suffix =isPassword? Icons.visibility: Icons.visibility_off_outlined;
    emit(PasswordVisibility());
  }
  void userLogin({
    required String Email,
    required String Password,
}) {
    emit(ShopLoginLoadingState());
    dioHelper.postData(
        path: LOGIN,
        data: {
      'email':Email,
      'password':Password,

    }).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.token);

      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((onError){

      emit(ShopLoginErrorState(onError.toString()));
      showToast(
        text:    "لم نتمكن من تسجيل الدخول برجاء التأكد من البيانات المدخلة",
        state: ToastStates.ERROR,
      );
    });
  }
}