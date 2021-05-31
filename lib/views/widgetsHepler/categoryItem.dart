import 'package:flutter/material.dart';
import 'package:shoppingapp/presenter/category.dart';

Widget categoryItem (Category model){
  return  Padding(
    padding: EdgeInsets.symmetric(horizontal: 6.0),
    child: Container(
      padding: EdgeInsets.symmetric(
          vertical: 15.0, horizontal: 30.0),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(
                  Colors.black.withOpacity(0.6),
                  BlendMode.hardLight),
              image: NetworkImage(model.image)
          )),
      child: Text(model.name,
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'Poppins_Regular',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          )),
    ),
  );
}
