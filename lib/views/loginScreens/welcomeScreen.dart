import 'package:flutter/material.dart';
import 'package:shoppingapp/presenter/swiperItem.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../shared/helperFunctions.dart';


class WelcomeScreen extends StatefulWidget {
  static const String ID = 'SplashScreen';
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<WelcomeScreen> {
  PageController _controller = PageController();
  bool islast = false ;

  List <SwiperItem> swiperItems = [
    SwiperItem(image: 'assets/images/Frame 1.png' , title1: 'Shopping Now' , title2: 'easy to use easy to buy '),
    SwiperItem(image: 'assets/images/In no time-pana.png' , title1: 'Shopping Now' , title2:  'easy to use easy to buy '),
    SwiperItem(image: 'assets/images/In no time-bro.png' , title1: 'Shopping Now' , title2:  'easy to use easy to buy '),
  ];
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: const EdgeInsets.only(top: 50),
                    alignment: Alignment.bottomCenter,
                    child: Text('WELCOME',
                        style: TextStyle(
                            color: Color(0xFF445A65),
                            fontSize: 40,
                            // fontWeight: FontWeight.w600,
                            fontFamily: 'RacingSansOne-Regular'))),
                Expanded(
                  child: PageView.builder(
                    physics: BouncingScrollPhysics(),
                    controller: _controller,
                    itemCount: swiperItems.length,
                    onPageChanged: (index){
                      if (index == swiperItems.length - 1){
                        setState(() {
                          islast = true ;
                        });
                      }
                      else {
                        setState(() {
                          islast = false ;
                        });
                      }
                    },
                    itemBuilder: (context, index) {
                        return Column (
                            mainAxisAlignment: MainAxisAlignment.center,
                        children :[
                          Expanded(
                            child: Image(
                              image: AssetImage(swiperItems[index].image),
                            ),
                          ),
                          Text(swiperItems[index].title1 , style : TextStyle(
                            fontSize: 22 ,
                            fontFamily: 'NotoSansJP-Light',
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF445A65),
                          )),
                          Text(swiperItems[index].title2 , style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NotoSansJP-Light',
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF445A65),
                          ),),
                        ]
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                SmoothPageIndicator(
                    controller: _controller,  // PageController
                    count:  3,
                    effect:  ExpandingDotsEffect(
                        activeDotColor:  Theme.of(context).primaryColor,
                        spacing: 5,
                        dotHeight: 8,
                        dotWidth : 15
                    ),  // your preferred effect
                    onDotClicked: (index){

                    }

                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              submit(context);
                            },
                            child: Text('Skip',
                                style: TextStyle(
                                  color: Color(0xFF445A65),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500
                                )),
                          ),
                          FloatingActionButton(
                            backgroundColor: Color(0xFF41A888),
                            onPressed: () {
                              setState(() {
                                   if (!islast)
                                   {
                                     _controller.nextPage(duration: Duration(milliseconds: 650), curve: Curves.easeIn);
                                   }else {
                                     submit(context);
                                   }
                              });
                            },
                            child: Icon(Icons.arrow_forward_ios_rounded, size: 25),
                          )
                        ]),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}


