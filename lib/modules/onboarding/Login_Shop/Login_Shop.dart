import 'package:ecommerce_flutter/modules/onboarding/Rejstertion/Rejesteration_Screen.dart';
import 'package:ecommerce_flutter/modules/onboarding/Shop_layout/Shoplayout.dart';
import 'package:ecommerce_flutter/network/Local/CachHelper.dart';
import 'package:ecommerce_flutter/shared/components/component/Components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Cubit/Cubit.dart';
import 'Cubit/States.dart';
class Login_Shop extends StatelessWidget {

  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  var formKey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>ShopLoginCubit(ShopLoginIntializeState()),
      child: BlocConsumer<ShopLoginCubit,LoginStates>(
        listener: (context,state){

          if(state is ShopLoginSuccessState){
            if(state.loginModel.status){

              buildToast(state.loginModel.message,Toaststate.Sucssec);
              CachHelper.setData(key: 'Token', value: state.loginModel.data.token).then((value) {

                navigationAndFinish(context,Shoplayout());

              }).catchError((error){

                buildToast(error,Toaststate.Error);
              });
            }
            else {
              buildToast(state.loginModel.message,Toaststate.Error);
            }
          }


        },

        builder:(context,state){
          return Scaffold(
              appBar: AppBar(),
              body: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Form(
                  key: formKey,
                  child: ListView(

                    children: [
                      SizedBox(height:100.0,),
                      Text("LOGIN",
                          style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          )),
                      SizedBox(height: 8.0,),
                      Text("Login to brewes our great offers",
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                              color: Colors.grey
                          )),
                      SizedBox(
                        height: 20.0,
                      ),
                      defultTextField(controller: emailController,
                          type: TextInputType.emailAddress,
                          validation: (String s){
                            if(s.isEmpty)return"Please fill this field";
                            else
                              return null;

                          },
                          title: 'Email Address',
                          prefix: Icons.email_outlined,
                          isClicked: true


                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      defultTextField(controller: passwordController,
                          type: TextInputType.visiblePassword,

                          validation: (String s){
                            if(s.isEmpty)return"Please fill this field";
                          }, title: "Password",
                          prefix: Icons.lock,
                          isClicked: true

                          ,suffixPress: (){
                            ShopLoginCubit.get(context).changePasswordvisibilty();

                          },
                          isPassword: ShopLoginCubit.get(context).isPassword
                          ,suffix: ShopLoginCubit.get(context).suffix),
                      SizedBox(height:30.0,),
                      if(state is! ShopLoginLoadingState)


                        defaultButton(function: (){
                        ShopLoginCubit.get(context).userlogin(email: emailController.text,
                            password: passwordController.text);
                      },text: "LOGIN")



                       else
                        CirclerProgressloadinh()

                      ,SizedBox(height:15.0,),
                      Row(children: [
                        Text("Don\'t Have an Account ?"),
                        TextButton(onPressed: (){
                          navigateTo(context,Rejester_screen());
                        }, child: Text("Signup"))
                      ],)
                    ],
                  ),
                ),
              )
          );
        } ,


      ),
    );
  }
}
