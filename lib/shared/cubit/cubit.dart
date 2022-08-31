import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/categories_model.dart';
import 'package:shop_app/models/favorites_model.dart';
import 'package:shop_app/models/loginmodel.dart';
import 'package:shop_app/modules/favorites.dart';
import 'package:shop_app/modules/settings.dart';
import 'package:shop_app/shared/network/end_points.dart';

import '../../models/change_favorite_model.dart';
import '../../models/home_model.dart';
import '../../modules/categories.dart';
import '../../modules/products.dart';
import '../components/components.dart';
import '../components/constant.dart';
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

  void changePasswordVisibility() {
    isPassword = !isPassword;

    suffix = isPassword ? Icons.visibility : Icons.visibility_off_outlined;
    emit(PasswordVisibility());
  }

  void userLogin({
    required String Email,
    required String Password,
  }) {
    emit(ShopLoginLoadingState());
    dioHelper.postData(path: LOGIN, data: {
      'email': Email,
      'password': Password,
    }).then((value) {
      print(value.data);
      loginModel = ShopLoginModel.fromJson(value.data);
      print(loginModel!.status);
      print(loginModel!.message);
      print(loginModel!.data!.token);

      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((onError) {
      emit(ShopLoginErrorState(onError.toString()));
      showToast(
        text: "لم نتمكن من تسجيل الدخول برجاء التأكد من البيانات المدخلة",
        state: ToastStates.ERROR,
      );
    });
  }

  HomeModel? homeModel;
  Map<int?, bool?> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    dioHelper
        .getData(
      path: HOME,
      token: token,
    )
        .then((value) {
      homeModel = HomeModel.fromjson(value.data);

      homeModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id: element.inFavorites,
        });
      });
      print(favorites.toString());
      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategoriesData() {
    dioHelper
        .getData(
      path: GET_CATEGORIES,
      token: token,
    )
        .then((value) {
      categoriesModel = CategoriesModel.fromjson(value.data);

      emit(ShopSuccessCategoriesDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesDataState());
    });
  }

  ChangeFavoriteModel? changeFavoriteModel;

  void changeFavorites(int productId) {
    favorites[productId]= !favorites[productId]!;
    emit(ShopChangeFavoriteState());

    dioHelper
        .postData(
      path: FAVORITES,
      data: {
        'product_id': productId,
      },
      token: token,
    ).then((value) {
      changeFavoriteModel = ChangeFavoriteModel.fromjson(value.data);
      print(value.data);
      if(changeFavoriteModel?.status ==false ){
        favorites[productId]= !favorites[productId]!;

      }
      else{
        getFavorites();
      }
      emit(ShopSuccessChangeFavoriteState(changeFavoriteModel!));
    }).catchError((error) {
      favorites[productId]= !favorites[productId]!;

      emit(ShopErrorChangeFavoriteState());
    });
  }

  FavoritesModel? favoriteModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    dioHelper
        .getData(
      path: FAVORITES,
      token: token,
    )
        .then((value) {
      favoriteModel = FavoritesModel.fromJson(value.data);
      printFullText(value.data.toString());
      emit(ShopSuccessGetFavoriteState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoriteState());
    });
  }
}
