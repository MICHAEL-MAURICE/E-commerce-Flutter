abstract class LoginStates{}
class ShopLoginIntializeState extends LoginStates{}
class ShopLoginLoadingState extends LoginStates{}
class ShopLoginSuccessState extends LoginStates{}
class ShoppasswordvisibleState extends LoginStates{}
class ShopLoginErrorState extends LoginStates{
  late final String error;
  ShopLoginErrorState(this.error);
}
