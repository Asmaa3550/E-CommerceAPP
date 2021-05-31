import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/network/cachedHelper.dart';

class CustomAppBar extends StatelessWidget {
  final String title ;
  final bool withIcon ;
  CustomAppBar({this.title , this.withIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top : 10.0),
      child: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: IconButton(
          padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
          onPressed: () {
          },
          icon: Icon(
            Icons.format_list_bulleted,
            color: Theme.of(context).primaryColor,
            size: 28.0,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 13),
          child: Text(title,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 22.0,
                  fontFamily: 'Raleway-ExtraLight',
                  fontWeight: FontWeight.w500
              )),
        ),
        actions: [
          if (withIcon == true)
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 20),
                child: Icon(
                  Icons.shopping_bag,
                  color: Theme.of(context).primaryColor,
                  size: 30,
                )
            )
        ],
      ),
    );
  }
}
