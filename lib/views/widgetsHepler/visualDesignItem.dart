import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final double screenWidth;
 final bool withCheck ;
  ListItem({this.screenWidth , this.withCheck});

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool someBooleanValue = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      fit: StackFit.expand,
      children: [
        Container(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
              flex: 18,
              child: Container(
                width: widget.screenWidth / 2,
                decoration: BoxDecoration(
                  color: Color(0xFFEFEFEF),
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image.asset(
                  'assets/images/images.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Flexible(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Branding',
                  style: TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 18.0,
                    fontFamily: 'DINNextLTArabic_Regular',
                  ),
                  softWrap: true,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Flexible(
                flex: 7,
                child: Text(
                  'Agency is a full-service agency, busy designing and ',
                  style: TextStyle(
                    color: Color(0xFF171717),
                    fontSize: 16.0,
                    fontFamily: 'DINNextLTArabic_LIGHT',
                  ),
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ))
          ]),
        ),
        widget.withCheck == true ? Positioned(
          top:10,
          left: 10,
          child:Container(
            width:22,
            height:22,
            padding:EdgeInsets.zero,
            decoration : BoxDecoration (
              borderRadius: BorderRadius.all(Radius.circular(5)),
              border: Border.all(color: someBooleanValue ? Color(0xFFEC146E) : Color(0xFF707070), width: 4 ),
              color: someBooleanValue ? Color(0xFFEC146E) : Colors.white,
            ),
            child:Theme(
              data: ThemeData(unselectedWidgetColor: Colors.white),
              child: Checkbox(
                onChanged:(bool value) {
                  setState(() {
                    someBooleanValue = !someBooleanValue;
                  });
                },
                value: someBooleanValue,
                activeColor: Color(0xFFEC146E),
                checkColor: Colors.white,
                tristate: true,
              ),
            ),
          ),
        ) : Container(),
      ],
    );
  }
}
