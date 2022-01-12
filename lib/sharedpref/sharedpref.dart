import 'package:shared_preferences/shared_preferences.dart';

class SharedPref_Helper{

  static SharedPreferences ?sharedPreferences;

   static Future<dynamic> initSharedPref()async{
     print('helloali');
    sharedPreferences=await SharedPreferences.getInstance();

  }

  static Future<dynamic> setDataToSharePref({
  required String key,
  required dynamic value
  })async{
     switch(value.runtimeType){
       case  bool:{
         return await sharedPreferences!.setBool(key, value);
       }break;
       case String:{
         return await sharedPreferences!.setString(key, value);
     }break;
       case int:{
       return await sharedPreferences!.setInt(key, value);
     }break;
     case double:{
       return await sharedPreferences!.setDouble(key, value);
     }

       }}



  static  getDataFromSharepref({required String key})async{
     if (sharedPreferences!.get(key)==null){
       return sharedPreferences!.get(key)==false;
     }else{
       return sharedPreferences!.get(key);
     }

  }
  static getDataFromShareprefrences({required String key}){

      return  sharedPreferences!.get(key);


  }
  static Future<dynamic>clearSharedPref({required String key})async{
await sharedPreferences!.remove(key);
  }


}
