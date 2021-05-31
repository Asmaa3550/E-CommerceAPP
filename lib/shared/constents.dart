import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

var token = '';

// Language Codes .
const String arabic = 'ar';
const String english = 'en';
const String LanguageCode = 'LanguageCode';
Future<Locale> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  _prefs.setString(LanguageCode, languageCode);
  return _locale(languageCode);
}

Locale _locale(String languageCode) {
  Locale _temp;
  switch (languageCode) {
    case english:
      _temp = Locale(languageCode, 'US');
      break;

    case arabic:
      _temp = Locale(languageCode, 'SA');
      break;

    default:
      _temp = Locale(languageCode, 'US');
  }
  return _temp;
}

List<Color> colors = [
  Color(0xFFF16B76) ,
  Colors.purple ,
  Colors.blueAccent ,
  Colors.pinkAccent ,
  Colors.orangeAccent ,
  Colors.lightBlueAccent ,
  Colors.teal ,
  Colors.redAccent ,
  Colors.lightGreen ,
  Colors.black87
];

List<String> catImage  = [
  'cat1.jfif' ,
  'cat2.jfif' ,
  'cat3.jfif' ,
  'cat4.jfif' ,
  'cat5.png' ,
  'cat6.jfif' ,
];


//links
// https://www.getpostman.com/collections/94db931dc503afd508a5


