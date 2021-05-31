import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  static const String ID = 'productScreen';

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  String dropDownValue = 'Small';
  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    var appBarHeight = AppBar().preferredSize.height;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child : Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        body : Padding(
          padding : EdgeInsets.only(top: statusBarHeight),
          child: SingleChildScrollView(
            child : Column(
              children: [
                //image of product .
                Container (
                  width: screenWidth,
                  height : screenHeight * 0.6,
                  decoration: BoxDecoration(
                    image : DecorationImage(
                      image : AssetImage('assets/images/cute-cat-sweatshirt-gray (1).jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  width: screenWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40) , topRight: Radius.circular(40)),
                    color: Color(0xFFA7CFC3),
                  ),
                  child : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                          Row(
                            children : [
                              Text('EGP ' , style:TextStyle(
                                  fontSize:15 ,
                                  fontFamily: 'Poppins_Regular',
                                  color : Color(0xFF2b2e4a) ,
                                  fontWeight: FontWeight.w600
                              )),
                              Text('120' , style:TextStyle(
                                  fontSize:27 ,
                                  fontFamily: 'Poppins_Regular',
                                  color : Color(0xFF2b2e4a) ,
                                  fontWeight: FontWeight.w700
                              )),
                            ]
                          ),
                           Align(
                             alignment: Alignment.centerRight,
                             child: Container(
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(30)),
                                 color:Colors.grey[200],),
                               child : Row (
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.symmetric(horizontal: 20),
                                     child: Text('CART' ,style:TextStyle(
                                         fontSize:14 ,
                                         fontFamily: 'Poppins_Regular',
                                         color : Color(0xFF2b2e4a) ,

                                     ) ),
                                   ) ,
                                   Container(
                                     decoration: BoxDecoration(
                                       color:Color(0xFF2b2e4a),
                                       shape: BoxShape.circle,
                                     ),
                                     child: IconButton(
                                         icon: Icon(
                                       Icons.add, color:Colors.white , size: 16,
                                     ), onPressed: (){}),
                                   )
                                 ]
                               )
                             ),
                           )
                        ]),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Text('Brand : ' , style:TextStyle(
                              fontSize:17 ,
                              fontFamily: 'NotoSansJP-Light',
                          )),
                              SizedBox(width : 10) ,
                              Text('Dorathy' , style:TextStyle(
                                  fontSize:17 ,
                                  fontFamily: 'NotoSansJP-Light',
                              ))
                            ],
                          ),
                        ),
                        Text('Autumn Korean Kawaii Clothes Cartoon Black Cat Harajuku Fashion for Teen Girl.' , style:TextStyle(
                            fontSize:20 ,
                            fontFamily: 'NotoSansJP-Light',
                          fontWeight: FontWeight.w600
                        )),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Row(
                            children: [
                              Text('Size :', style:TextStyle(
                                  fontSize:20 ,
                                  fontFamily: 'Poppins_Regular',

                              )),
                               SizedBox(width:10.0),
                               DropdownButton<String>(
                                 value: dropDownValue,
                                items: <String>['Small', 'Medium', 'Large', 'X-Large'].map((String value) {
                                  return new DropdownMenuItem<String>(
                                    value: value,
                                    child: new Text(value),
                                  );
                                }).toList(),
                                onChanged: (value) {
                                  setState(() {
                                    dropDownValue = value ;
                                  });
                                },
                              )
                      ]
                          ),
                        ),
                        Container(
                          height: 50,
                          child: Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children : [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(10),
                                  ),
                                  child :Text('BUY NOW' , textAlign: TextAlign.center, style :TextStyle(
                                    fontSize: 16
                                  )),
                                ),
                              ),
                              SizedBox(width : 15),
                              Expanded(
                                flex :1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(horizontal: 20 , vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border : Border.all(
                                      color : Color(0xFF2b2e4a) ,
                                    )
                                  ),
                                  child :Text('X' , textAlign: TextAlign.center, style : TextStyle(  color : Color(0xFF2b2e4a) ,)),
                                ),
                              ),
                            ]
                          ),
                        )
                      ],
                    ),
                  )
                ),

              ]
            )
          ),
        ),
      )
    );
  }
}
