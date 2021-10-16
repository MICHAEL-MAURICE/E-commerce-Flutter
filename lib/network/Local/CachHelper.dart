import 'package:shared_preferences/shared_preferences.dart';
class CachHelper{

  static  SharedPreferences ? shared;

  static init()async{
    shared = await SharedPreferences.getInstance() ;
  }

  static Future <bool> setData(
  {required String key,
  required bool value}
      )async{
    
    return await shared!.setBool(key, value);
  }
 static bool? getData(
  {required String key}){
    return shared!.getBool(key);


  }
  
}