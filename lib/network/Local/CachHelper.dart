import 'package:shared_preferences/shared_preferences.dart';
class CachHelper{

  static  SharedPreferences ? shared;

  static init()async{
    shared = await SharedPreferences.getInstance() ;
  }

  static Future <bool> setData(
  {required String key,
  required dynamic value}
      )async{
    if(value is bool)
    return await shared!.setBool(key, value);
    if(value is String)
      return await shared!.setString(key, value);
    if(value is int)
      return await shared!.setInt(key, value);

      return await shared!.setDouble(key, value);
  }
 static dynamic? getData(
  {required String key}){
    return shared!.get(key);


  }
  
}