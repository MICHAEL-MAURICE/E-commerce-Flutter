import 'package:ecommerce_flutter/shared/Cubit/Cubit.dart';
import 'package:ecommerce_flutter/shared/Cubit/States.dart';
import 'package:ecommerce_flutter/shared/components/component/Components.dart';
import 'package:ecommerce_flutter/shared/components/style/colors/Themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:async';
import 'Login_Shop/Login_Shop.dart';


class Bordingmodel{

   late final String image;
   late final String title;
   late final String body;
   Bordingmodel({
     required this.image,required this.title, required this.body
});
}
class Onboarding extends StatelessWidget {

  var onboardingController=PageController();
  List<Bordingmodel>onBordingItemes=[
    Bordingmodel(image: "assets/imgs/img2.jpg", title: "Screen title 1", body: "Screen body 1"),
    Bordingmodel(image: "assets/imgs/img2.jpg", title: "Screen title 2", body: "Screen body 2"),
    Bordingmodel(image: "assets/imgs/img3.png", title: "Screen title 3", body: "Screen body 3"),
  ];

  @override
  Widget build(BuildContext context) {



    return BlocConsumer<Appcubit,AppState>(builder: (context,state){
      Appcubit Cubit =Appcubit.get(context);
      return Scaffold(
        appBar: AppBar(actions: [
          TextButton(onPressed:(){navigationAndFinish(context,Login_Shop());}, child:Text("SKIP",style: TextStyle(fontSize: 18.0),) ),
        ],),
        body: Padding(
          padding: const EdgeInsets.only(top: 150.0,right: 20.0,left: 20.0,bottom: 30.0),
          child:   Column(children: [
            Expanded(child: PageView.builder(

                onPageChanged: (index){
                  if(index == onBordingItemes.length-1)
                  {

                      Cubit.isLastPage(true);
                  }
                  else{

                      Cubit.isLastPage(false);


                  }
                },
                controller: onboardingController,
                itemCount: onBordingItemes.length,
                itemBuilder: (context,index)=>itemSpacer(onBordingItemes[index]))),
            Row(children: [
              SmoothPageIndicator(controller: onboardingController,
                  effect: ExpandingDotsEffect(
                      dotColor: Colors.grey
                      ,dotHeight: 10.0,
                      dotWidth: 10.0,
                      strokeWidth: 5.0
                      ,expansionFactor: 4.0,
                      activeDotColor: lightTheme.primaryColor
                  ),

                  count: onBordingItemes.length)
              ,Spacer(),
              FloatingActionButton(onPressed: (){
                if(Cubit.isLast){
                  navigationAndFinish(context,Login_Shop());
                }
                else {
                  onboardingController.nextPage(duration: Duration(milliseconds: 750),
                      curve: Curves.fastLinearToSlowEaseIn);
                }
              },child: Icon(Icons.arrow_forward),)
            ],),
          ],),
        ),

      );
    }, listener: (context,state){});
  }

  Widget itemSpacer( Bordingmodel model){

    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("${model.image}")
        ,SizedBox(height: 60.0,),
        Text("${model.title}",style: TextStyle(fontSize: 24,fontFamily: "bodyText1"),),
        SizedBox(height: 30.0,),
        Text("${model.body}",style: TextStyle(fontSize: 14,fontFamily: "bodyText1"),),

      ],
    );
  }

}
