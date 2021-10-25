import 'package:ecommerce_flutter/models/Home.dart';
import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Products_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return BlocConsumer<Appcubit,AppState>(builder: (context,state){
      Appcubit cubit=Appcubit.get(context);
      return cubit.homeModel==null?Center(child: CircularProgressIndicator(),):builderWidget(cubit.homeModel!);


    }, listener:(context,state) {});


  }

  Widget builderWidget(HomeModel model) => Column(
    children:
    [
      CarouselSlider(
        items: model.data!.banners.map((e) => Card(
          elevation: 20.0,
          child: Image(
            image: NetworkImage('${e.image}'),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),).toList(),
        options: CarouselOptions(
          height: 200.0,
          initialPage: 0,
          viewportFraction: 1.0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(seconds: 1),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
        ),
      ),
    ],
  );
}