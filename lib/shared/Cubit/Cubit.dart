
import 'package:bloc/bloc.dart';
import 'package:ecommerce_flutter/models/Categories.dart';
import 'package:ecommerce_flutter/models/Home.dart';
import 'package:ecommerce_flutter/modules/onboarding/Categories_screen/Categories_screen.dart';
import 'package:ecommerce_flutter/modules/onboarding/Favourite_screen/Favourite_screen.dart';
import 'package:ecommerce_flutter/modules/onboarding/Products_screen/Products_screen.dart';
import 'package:ecommerce_flutter/modules/onboarding/Search_screen/Search_screen.dart';
import 'package:ecommerce_flutter/modules/onboarding/Settings_screen/Settings_screen.dart';
import 'package:ecommerce_flutter/network/End_points.dart';

import 'package:ecommerce_flutter/network/Local/CachHelper.dart';
import 'package:ecommerce_flutter/network/Remote/DioHelper.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:ecommerce_flutter/shared/components/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Appcubit extends Cubit<AppState>{
  Appcubit() : super(Intialstate());

  static Appcubit get(context)=>BlocProvider.of(context);
  int currentIndex=0;

  void changeIndx(int index){
    currentIndex=index;
    emit(AppbottomNavbar());

  }
  List<Widget>Screens=[
    Products_screen(),
    Favourite_screen(),
    Categories_screen(),
    Settings_screen()


  ];

  List<BottomNavigationBarItem>items=[
    BottomNavigationBarItem(icon: Icon(Icons.home_outlined),title: Text("Products")),
    BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),title: Text("Favourite")),
    BottomNavigationBarItem(icon: Icon(Icons.category_outlined),title: Text("Categories")),
    BottomNavigationBarItem(icon: Icon(Icons.settings_outlined),title: Text("Settings")),
  ];




  bool isLast=false;
  void isLastPage(bool b){
    isLast = b;
    emit(IslastPage());
  }


  bool themeModebool=false;
  void changeTheme({bool? isDark} ){
    if(isDark !=null) {
      themeModebool = isDark;
      emit(ThemeModeState());
    }else {
      themeModebool = !themeModebool;
      CachHelper.setData(key: 'themeModebool', value: themeModebool).then((
          value) {
        emit(ThemeModeState());
      });
    }


  }
  HomeModel? homeModel;
  void gethomedata(){
    emit(HomeDataLoadingState());
    Diohelper.getdata(url:HOME,
        token: token!

    ).then((value) {
      homeModel=HomeModel.fromJson(value.data);
      print(homeModel!.data!.banners![0].image);
      emit(HomeDataSuccessState());


    }).catchError((error){
      print (error);
      emit(HomeDataErrorState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategoriesdata(){

    Diohelper.getdata(url:Get_categories,
        token: token!

    ).then((value) {
      categoriesModel=CategoriesModel.fromJson(value.data);

      emit(CategoriesDataSuccessState());


    }).catchError((error){
      print (error);
      emit(CategoriesDataErrorState());
    });
  }

}