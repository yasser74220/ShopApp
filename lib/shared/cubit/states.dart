import 'package:shop_app/modules/login.dart';

import '../../models/loginmodel.dart';

abstract class ShopLoginStates {

}

class AppInitialState extends ShopLoginStates {

}
class ShopLoginLoadingState extends ShopLoginStates {

}

class ShopLoginSuccessState extends ShopLoginStates {
  final ShopLoginModel loginModel;

  ShopLoginSuccessState(this.loginModel);

}
class ShopLoginErrorState extends ShopLoginStates {
  final String error;

  ShopLoginErrorState(this.error);
}
class PasswordVisibility extends ShopLoginStates{

}
class ShopChangeBottomNavState extends ShopLoginStates{

}
class ShopLoadingHomeDataState extends ShopLoginStates{

}
class ShopSuccessHomeDataState extends ShopLoginStates{

}
class ShopErrorHomeDataState extends ShopLoginStates{

}