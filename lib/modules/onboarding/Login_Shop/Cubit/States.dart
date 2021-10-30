import 'package:ecommerce_flutter/models/Login.dart';

abstract class LoginStates{}
class ShopLoginIntializeState extends LoginStates{}
class ShopLoginLoadingState extends LoginStates{}
class ShopLoginSuccessState extends LoginStates{
  late final ShopLoginmodel loginModel;
  ShopLoginSuccessState(this.loginModel);
}
class ShoppasswordvisibleState extends LoginStates{}
class ShopLoginErrorState extends LoginStates{
  late final String error;
  ShopLoginErrorState(this.error);
}
