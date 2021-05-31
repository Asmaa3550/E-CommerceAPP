import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final screenWidth ;
  final screenHeight;
  ProductItem({this.screenWidth , this.screenHeight});
  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  bool checked = false ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.only(left: 20,right:20 ,top: 20),
      child:Stack(
        overflow: Overflow.visible,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(28.0),
                  ),
              color: Color(0xFFF3F9F1),
            ),
            child: Row(
              children: [
                Container(
                  height: widget.screenHeight *0.2,
                  decoration: BoxDecoration(
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(topLeft:  Radius.circular(28.0) , bottomLeft:  Radius.circular(28.0)),
                    child: Image.asset(
                      'assets/images/5f315f60c2418.png',
                      fit: BoxFit.fill,
                      width: widget.screenWidth / 3,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children : [
                        Text(
                          'Play paper',
                          style: TextStyle(
                            color: Color(0xFF171717),
                            fontSize: 18.0,
                            fontFamily: 'Poppins_Regular',
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          'Design and print',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 18.0,
                            fontFamily: 'Poppins_Regular',
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '1000 copies',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontSize: 18.0,
                            fontFamily: 'Poppins_Regular',
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '70 JD',
                          style: TextStyle(
                              color: Color(0xFFEC146E),
                              fontSize: 18.0,
                              fontFamily: 'Poppins_Regular',
                              fontWeight: FontWeight.w600
                          ),
                          softWrap: true,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 7,
            right : 7,
            child: InkWell(
              onTap: () {
                setState(() {
                  checked = !checked;
                });
              },
              child: Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  border:Border.all(color: Color(0xFFF0F0F0)),
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.bookmark,
                    color:
                    checked ? Color(0xFFEC146E) : Color(0xffD5D5D5),
                    size: 25,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
