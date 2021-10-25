import 'package:ecommerce_flutter/modules/onboarding/Login_Shop/Login_Shop.dart';
import 'package:ecommerce_flutter/modules/onboarding/Onboarding.dart';
import 'package:ecommerce_flutter/network/Local/CachHelper.dart';
import 'package:ecommerce_flutter/network/Remote/DioHelper.dart';
import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:ecommerce_flutter/shared/components/constants/constants.dart';
import 'package:ecommerce_flutter/shared/components/style/colors/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'layout/Homelayout.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'modules/onboarding/Shop_layout/Shoplayout.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  Diohelper.init();
Widget widget;

  bool? isDark =CachHelper.getData(key: 'themeModebool');
  bool? onBoarding = CachHelper.getData(key: "onboarding");
  token = CachHelper.getData(key: "Token");
  if(onBoarding!=null){
    if(token !=null){
      widget= Shoplayout();
    }else{
      widget=Login_Shop();
    }
  }
  else{
    widget=Onboarding();
  }


  runApp(MyApp(isDark,widget));
}

class app extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


        debugShowCheckedModeBanner: false,
        theme:lightTheme,

        home: Onboarding()
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final  bool? isDark;
  final Widget widget;
  MyApp(this.isDark,this.widget);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>Appcubit()..changeTheme(isDark: isDark)..gethomedata(),

      child: BlocConsumer<Appcubit,AppState>(
         builder: (BuildContext context, state) {
var cubit = Appcubit.get(context);
           return MaterialApp(


               debugShowCheckedModeBanner: false,
               theme:lightTheme,
               darkTheme: darkTheme,
               themeMode: cubit.themeModebool?ThemeMode.light:ThemeMode.dark,
               home:widget
           );

         },listener: (BuildContext context, Object? state) {  },



      ),
    );
  }
}


