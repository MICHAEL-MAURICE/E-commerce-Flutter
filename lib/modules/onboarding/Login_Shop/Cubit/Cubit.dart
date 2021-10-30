
import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/models/Login.dart';
import 'package:ecommerce_flutter/modules/onboarding/Login_Shop/Cubit/States.dart';
import 'package:ecommerce_flutter/network/End_points.dart';
import 'package:ecommerce_flutter/network/Remote/DioHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopLoginCubit extends Cubit<LoginStates>{
  // ignore: non_constant_identifier_names
  ShopLoginCubit(LoginStates ShopLoginIntializeState) : super(ShopLoginIntializeState);
  ShopLoginmodel? LoginModel;
  static ShopLoginCubit get(context)=>BlocProvider.of(context);
  IconData suffix= Icons.visibility_outlined;
  bool isPassword=true;

  void changePasswordvisibilty(){
    isPassword=!isPassword;

    suffix=isPassword?Icons.visibility_outlined:Icons.visibility_off_outlined;
    emit(ShoppasswordvisibleState());

  }
  void userlogin({required String email, required String password})
  {
    emit(ShopLoginLoadingState());
Diohelper.postdata(url: LOGIN,
    data: {
  'email':email,
  'password':password
}

).then((value) {
  print(value);
  LoginModel = ShopLoginmodel .fromJson(value.data);
  print(LoginModel!.message);
  emit(ShopLoginSuccessState(LoginModel!));

}).catchError((error){
  emit(ShopLoginErrorState(error.toString()));
});


  }

}