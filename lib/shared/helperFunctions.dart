import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shoppingapp/views/loginScreens/signInScreen.dart';
import 'network/cachedHelper.dart';


enum ToastColor {ERROR , SUCCESS , WARNING}


void navigatAndFinish(Widget nextScreen, context) {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => nextScreen));
}
void navigateTo(Widget nextScreen, context) {
  Navigator.push(
      context, MaterialPageRoute(builder: (context) => nextScreen));
}
void submit(context) {
  CachedHelper.saveData('onBoarding', true).then((value) {
    navigateTo(SignInScreen(), context);
  });
}
void ToastBuilder({@required String message , @required ToastColor state}){
     Fluttertoast.showToast(
     msg: message,
     toastLength: Toast.LENGTH_LONG,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 5,
     backgroundColor: toastColors(state),
     textColor: Colors.white,
     fontSize: 16.0
 );
}
Color toastColors (ToastColor state){
  if (state == ToastColor.SUCCESS )
    return Colors.green;
  else if (state == ToastColor.ERROR )
    return Colors.red;
  else
    return Colors.teal;

}



