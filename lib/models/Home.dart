class Shophomemodel{
  bool? status;
  Homedata? data;
  Shophomemodel.fromJson(Map<String,dynamic>json){
    status=json["status"];


  }

}
class Homedata{
  List<HomeBanners>? banners;
  List<HomeProducts>? products;
  Homedata.fromJson(Map<String,dynamic>json){
    json["banners"].foreach((element){
      banners!.add(element);
    });

    json["products"].foreach((element){
      products!.add(element);
    });
  }
}
class HomeBanners{
int? id;
String? image;
HomeBanners.fromJson(Map<String,dynamic>json){
  id=json["id"];
  image=json["image"];

}
}
class HomeProducts{
int? id;
dynamic? price;
dynamic?old_price;
dynamic? discount;
String? image;
String?name;
bool? in_favorites;
bool? in_cart;
HomeProducts.fromJson(Map<String,dynamic>json){
  id=json["id"];
  price=json["price"];
  old_price=json["old_price"];
  discount=json["discount"];
  image=json["image"];
  name=json["name"];
  in_favorites=json["in_favorites"];
  in_cart=json["in_cart"];



}


}