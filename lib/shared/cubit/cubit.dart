
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 import '../network/local/cache_helper.dart';
import 'states.dart';
import 'package:shop_app/shared/network/remote/dio.dart';




class AppCubit extends Cubit<ShopStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  void userLogin(){

}
}