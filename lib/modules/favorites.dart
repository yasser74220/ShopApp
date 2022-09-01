import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cubit/cubit.dart';
import 'package:shop_app/shared/cubit/states.dart';

import '../models/favorites_model.dart';
import '../shared/components/components.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  {
    return BlocConsumer<AppCubit, ShopLoginStates>(
      listener: (context, state) {},
      builder: (context, state)
      {
        var cubit = AppCubit.get(context);

      return ConditionalBuilder(
          condition: state is! ShopLoadingGetFavoritesState,
          builder: (context) => ConditionalBuilder(
            fallback:(context)=> Center(child: CircularProgressIndicator()),
            condition: state is !ShopLoadingGetFavoritesState,
            builder: (context)=> ListView.separated(
              itemBuilder: (context, index) => buildListProduct(cubit.favoriteModel!.data!.data[index].product!, context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: AppCubit.get(context).favoriteModel!.data!.data.length,
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

}
