import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Appcubit cubit=Appcubit.get(context);
    return BlocConsumer<Appcubit,AppState>(
   listener: (context,state){

   },
      builder: (context,state){
     return    Scaffold(
       body: Text("Settings_screen",style: Theme.of(context).textTheme.bodyText1,),
       floatingActionButton: FloatingActionButton(onPressed: () {
cubit.changeTheme();
       },),
     );
      },
    );
  }
}
