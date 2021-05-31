import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


const Color secondaryColor = Color(0xFFA7CFC3);

ThemeData lightTheme = ThemeData(
  secondaryHeaderColor: secondaryColor,
  primaryColor: HexColor('41A888'),
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: AppBarTheme(
    titleTextStyle: TextStyle(
        color : Colors.black,
        fontSize : 20.0 ,
        fontWeight: FontWeight.w700
    ),
    elevation: 0.0 ,
    color: Colors.white,
    iconTheme: IconThemeData(
        color: Colors.white
    ),
    backwardsCompatibility: false,
    systemOverlayStyle: SystemUiOverlayStyle(
      // statusBarColor:  Color(0xFF41A888),
      statusBarIconBrightness: Brightness.light,
    ) ,
  ),
  // bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //     type: BottomNavigationBarType.fixed,
  //     showSelectedLabels: false ,
  //     showUnselectedLabels: false,
  //     selectedItemColor: Color(0xFF41A888)
  // ),
  textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        fontFamily: 'Amiri-Regular',
      )
  ),
);

ThemeData darkTheme =  ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        fontSize: 16.0,
        fontFamily: 'Amiri-Regular',
      )
  ),
  primaryColor: Colors.deepOrangeAccent,
  primarySwatch: Colors.deepOrange,
  scaffoldBackgroundColor: HexColor('2D2D31'),
  appBarTheme: AppBarTheme(
      backgroundColor: Colors.black38,
      titleTextStyle: TextStyle(color : Colors.deepOrangeAccent),
      actionsIconTheme: IconThemeData(color : Colors.deepOrangeAccent)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false ,
      showUnselectedLabels: false,
      selectedItemColor: Colors.deepOrangeAccent,
      backgroundColor: Colors.black38,
      unselectedIconTheme: IconThemeData(
          color : Colors.grey
      )
  ),

);