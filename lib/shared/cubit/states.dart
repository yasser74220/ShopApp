import 'package:shop_app/modules/login.dart';

import '../../models/change_favorite_model.dart';
import '../../models/loginmodel.dart';

abstract class ShopLoginStates {}

class AppInitialState extends ShopLoginStates {}

class ShopLoginLoadingState extends ShopLoginStates {}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);
}

class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}

class PasswordVisibility extends ShopLoginStates {}

class ShopChangeBottomNavState extends ShopLoginStates {}

class ShopLoadingHomeDataState extends ShopLoginStates {}

class ShopSuccessHomeDataState extends ShopLoginStates {}

class ShopErrorHomeDataState extends ShopLoginStates {}

class ShopSuccessCategoriesDataState extends ShopLoginStates {}

class ShopErrorCategoriesDataState extends ShopLoginStates {}

class ShopSuccessChangeFavoriteState extends ShopLoginStates {
  final ChangeFavoriteModel model;

  ShopSuccessChangeFavoriteState(this.model);
}

class ShopErrorChangeFavoriteState extends ShopLoginStates {}

class ShopChangeFavoriteState extends ShopLoginStates {}

class ShopSuccessGetFavoriteState extends ShopLoginStates {}

class ShopErrorGetFavoriteState extends ShopLoginStates {}

class ShopLoadingGetFavoritesState extends ShopLoginStates {}

class ShopLoadingUserDataState extends ShopLoginStates {}

class ShopSuccessUserDataState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopSuccessUserDataState(this.loginModel);
}

class ShopErrorUserDataState extends ShopLoginStates {}

class ShopLoadingUpdateUserState extends ShopLoginStates {}

class ShopSuccessUpdateUserState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopSuccessUpdateUserState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopLoginStates {}

