import 'package:flutter/material.dart';

class productCard extends StatefulWidget {
  final context ;
  bool checked= false;
  final withIcon;
  final Color cardColor ;
  productCard({this.context , this.withIcon , this.cardColor});
  @override
  _productCardState createState() => _productCardState();
}

class _productCardState extends State<productCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(widget.context).size.height;
    double width = MediaQuery.of(widget.context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(alignment: AlignmentDirectional.centerEnd, children: [
        Container(
            color: Colors.white,
            height: height * 0.28,
            width: width * 0.8,
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadowColor: Colors.white54,
              child: Row(
                children: [
                  Container(
                    width: width * 0.40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text('Play Paper',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF404852),
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "SFPro_Regular")),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Flexible(
                              child: Text(
                                  'Order your customized\r\r\ncards or order with design ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF404852).withOpacity(0.6),
                                      fontWeight: FontWeight.w600)),
                            ),
                            SizedBox(
                              height: 17,
                            ),
                            Flexible(
                              child: Text('70 JD',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Color(0xFF7D3794),
                                      fontWeight: FontWeight.w700,
                                      fontFamily: "Roboto")),
                            )
                          ]),
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            left: width * 0.02,
            top: 16,
            child: Card(
              color: Colors.blue,
              // elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
              shadowColor: Colors.white54,
              child: Container(
                  height: height * 0.22,
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                    color: Color(0xFFEFEFEF),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      'assets/images/5f36f5c58d0f9.png',
                      fit: BoxFit.cover,
                    ),
                  )
                ),
            )),
        widget.withIcon ? Positioned(
          top: 20,
          right : 20,
          child: InkWell(
            onTap: () {
              setState(() {
                widget.checked = !widget.checked;
              });
            },
            child: Container(
              width: 37,
              height: 37,
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
                  widget.checked ? Color(0xFFEC146E) : Color(0xffD5D5D5),
                  size: 23,
                ),
              ),
            ),
          ),
        ) : Container(),
      ]),
    );
  }
}
