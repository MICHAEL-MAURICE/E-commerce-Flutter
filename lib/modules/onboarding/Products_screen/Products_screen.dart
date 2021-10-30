

import 'package:ecommerce_flutter/models/Categories.dart';
import 'package:ecommerce_flutter/models/Categories.dart';
import 'package:ecommerce_flutter/models/Categories.dart';
import 'package:ecommerce_flutter/models/Categories.dart';
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

      return cubit.homeModel==null?Center(child: CircularProgressIndicator(),):
      builderWidget(cubit.homeModel!,cubit.categoriesModel!);


    }, listener:(context,state) {});


  }

  Widget builderWidget(HomeModel model,
      CategoriesModel modell) => SingleChildScrollView(
    child: Column(
      children:
      [
        CarouselSlider(
          items: model.data!.banners!.map((e) => Card(
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

        SizedBox(
          height: 10.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 100.0,
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => buildCategoryItem(modell.data!.data![index]),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 10.0,
                  ),
                  itemCount: modell.data!.data!.length,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'New Products',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(

          child: GridView.count(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 20,
            childAspectRatio: 1/1.4,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: List.generate(model.data!.products!.length, (index) => buildProuductCard
              (model.data!.products![index])),),
        )
      ],
    ),
  );
  Widget buildProuductCard(ProductModel model){


    return Card(

      color: Colors.transparent,
      borderOnForeground: true,
      elevation: 20.0,

      child: Container(

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)

            ,color: Colors.white
        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Stack(

              alignment: Alignment.bottomLeft,
              children: [
                Image(image: NetworkImage(model.image!)

                  ,  width: 200,
                  height: 170,
                ),
                if(model.discount!=0)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    color:Colors.red,
                    child: Text("Discount",
                      style: TextStyle(color: Colors.white),),
                  )
              ],
            )
            ,SizedBox(height: 3,)
            ,Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(

                children: [
                  Text(model.name!,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,

                    style: TextStyle(fontSize: 16.0,
                        height: 1.3,
                        fontWeight: FontWeight.bold
                      //color: Theme.of(context).textTheme.bodyText1!.color,


                    ),
                  ),
                  Row(
                    children: [
                      Text(model.price!.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(fontSize: 16.0,
                            color: Colors.green
                          //color: Theme.of(context).textTheme.bodyText1!.color,


                        ),
                      ),
                      SizedBox(width: 5,)
                      ,  if (model.discount!=0)
                        Text(model.oldPrice!.toString(),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(fontSize: 14.0,
                              color: Colors.grey
                              ,decoration: TextDecoration.lineThrough
                            //color: Theme.of(context).textTheme.bodyText1!.color,


                          ),

                        )

                      ,
                      Spacer(),
                      IconButton(onPressed: (){}, icon:Icon( Icons.favorite_border_outlined,color: Colors.red,))
                    ],
                  ),
                ],
              ),
            )
            ,

          ],
        ),
      ),
    );
  }

  Widget buildCategoryItem(DataModel model) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children:
    [
      Image(
        image: NetworkImage(model.image!),
        height: 100.0,
        width: 100.0,
        fit: BoxFit.cover,
      ),
      Container(
        color: Colors.black.withOpacity(.8,),
        width: 100.0,
        child: Text(
          model.name!,
          textAlign: TextAlign.center,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}


