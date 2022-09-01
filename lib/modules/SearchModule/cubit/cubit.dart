import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:shop_app/modules/SearchModule/cubit/states.dart';
import 'package:shop_app/shared/network/remote/dio.dart';

import '../../../models/search_model.dart';
import '../../../shared/components/constant.dart';
import '../../../shared/network/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? Searchmodel;

  void search(String text) {
    emit(SearchLoadingState());

    dioHelper.postData(
      path: SEARCH,
      token: token,
      data: {
        'text': text,
      },
    ).then((value)
    {
      Searchmodel = SearchModel.fromJson(value.data);

      emit(SearchSuccessState());
    }).catchError((error)
    {
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}