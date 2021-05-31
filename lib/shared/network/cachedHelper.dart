import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CachedHelper {

  static SharedPreferences sharedPreferences ;
  static CachedHelper get(context) => CachedHelper();

  static init () async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future <bool> saveData (
      @required String key ,
      @required dynamic value
      )async{
    return await sharedPreferences.setString('$key', value.toString());
  }

  static Future <dynamic> getData (@required String key) async{
    return await sharedPreferences.get('$key');
  }
  static Future <bool> clearData (@required String key) async{
    return await sharedPreferences.remove('$key');
  }
}
