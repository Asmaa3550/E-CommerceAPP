import 'package:flutter/cupertino.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

Widget bannerBuilder(screenWidth, screenHeight, bannerList) {
  return Container(
    width: screenWidth,
    height: screenHeight * 0.32,
    padding: EdgeInsets.symmetric(vertical: 10),
    child: Swiper(
      itemCount: bannerList.length,
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
            image: DecorationImage(
                image: NetworkImage(bannerList[index].image),
                fit: BoxFit.cover),
          ),
          // child: Column(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.all(4),
          //         child: Text('Sale Up To 40% ',
          //             textAlign: TextAlign.center,
          //             style: TextStyle(
          //               fontSize: 18,
          //               fontFamily: 'Poppins_Regular',
          //             )),
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.all(Radius.circular(3)),
          //         ),
          //       ),
          //       Text('Brand : Shein T-shirts',
          //           style: TextStyle(
          //               fontSize: 18,
          //               fontFamily: 'Poppins_Regular',
          //               color: Colors.white)),
          //     ]),
        );
      },
    ),
  );
}