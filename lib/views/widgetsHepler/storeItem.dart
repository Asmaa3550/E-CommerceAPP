import 'package:flutter/material.dart';

class StoreItem extends StatefulWidget {
  final screenWidth;
  final screenHeight;

  StoreItem({this.screenWidth, this.screenHeight});
  @override
  _StoreItemState createState() => _StoreItemState();
}

class _StoreItemState extends State<StoreItem> {
  bool bookIconValue = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        overflow: Overflow.visible,
        fit: StackFit.passthrough,
        children: [
          Container(
              padding: EdgeInsets.all(20),
              width: widget.screenWidth * 0.55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color(0xFFF0F0F0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Image.asset(
                    'assets/images/images.jpg',
                    fit: BoxFit.fill,
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      'Calender',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins_Regular',
                          color: Color(0xFF3C124A),
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      'Design and Print',
                      style: TextStyle(
                          fontSize: 14,
                          fontFamily: 'Poppins_Regular',
                          color: Color(0xFF7B7B7B)),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Text(
                      '50 JD',
                      style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'Poppins_Regular',
                          color: Color(0xFF7D3794),
                          fontWeight: FontWeight.w700),
                      softWrap: true,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
                ],
              )),
          Positioned(
            top: 15,
            left: 15,
            child: InkWell(
              onTap: () {
                setState(() {
                  bookIconValue = !bookIconValue;
                });
              },
              child: Container(
                width: 37,
                height: 37,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: CircleAvatar(
                  radius: 25,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.bookmark,
                    color:
                        bookIconValue ? Color(0xFFEC146E) : Color(0xffD5D5D5),
                    size: 23,
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
