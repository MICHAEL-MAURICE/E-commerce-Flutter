
import 'package:bloc/bloc.dart';

import 'package:ecommerce_flutter/network/Local/CachHelper.dart';
import 'package:ecommerce_flutter/network/Remote/DioHelper.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Appcubit extends Cubit<AppState>{
  Appcubit() : super(Intialstate());

  static Appcubit get(context)=>BlocProvider.of(context);
int currentIndex=0;


List<BottomNavigationBarItem>items=[
  BottomNavigationBarItem(icon: Icon(Icons.business),title: Text("Busniess")),
  BottomNavigationBarItem(icon: Icon(Icons.sports),title: Text("Sports")),
  BottomNavigationBarItem(icon: Icon(Icons.science),title: Text("Science")),

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

}