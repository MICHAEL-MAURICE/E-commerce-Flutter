
import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:ecommerce_flutter/shared/components/component/Components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';







class Home_layout extends StatelessWidget
{


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppState>(
      listener: (context,state){

      },
      builder: (context,state){
        Appcubit cubit = Appcubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("News App"),
            actions: [
              IconButton(icon: Icon(Icons.search),onPressed: (){


              },)
            ,IconButton(icon: Icon(Icons.brightness_6_outlined),onPressed: (){


              cubit.changeTheme();
              },)

            ],

          ),

          bottomNavigationBar: BottomNavigationBar(
            items: cubit.items,
            currentIndex: cubit.currentIndex,

          ),




        );

      },
    );
  }




}



