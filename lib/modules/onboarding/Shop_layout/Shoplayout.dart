import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Shoplayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Appcubit,AppState>(
      listener: (context ,state){},
      builder: (context,state){
        Appcubit cubit=Appcubit.get(context);
        return Scaffold(
          
          appBar: AppBar(title: Text("Shopy"),),
          body: cubit.Screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(items: cubit.items,
            onTap:(idx)=> cubit.changeIndx(idx),
            currentIndex: cubit.currentIndex,
            
          ),
        );
      },
    );
  }
}
