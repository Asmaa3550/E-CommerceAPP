// import 'package:flutter/material.dart';
//
// class NewTasksScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding : EdgeInsets.all(20.0),
//       child : Row(
//         children: [
//           CircleAvatar(
//             radius: 40.0,
//             child : Text(
//               '10:53 PM' , style: TextStyle(
//               color : Colors.white,
//               fontFamily: 'ZenDots-Regular' ,
//               fontSize: 12.0
//             ),),
//             backgroundColor: Colors.deepPurple,
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
//             child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisSize: MainAxisSize.min,
//                 children :[
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal:3),
//                   child: Text('Go To School..', style: TextStyle(
//                   color : Colors.black,
//                   fontFamily: 'UbuntuMono-Regular' ,
//                   fontSize: 18.0
//             )),
//                 ),
//                 SizedBox(height: 4.0),
//                 Container(
//                   alignment: Alignment.centerLeft,
//                   width : 100.0,
//                   child: Divider(
//                     color: Colors.black ,
//                     thickness: 2,
//                     indent: 5,
//                     endIndent: 40,),
//                 ),
//                 Text('2021 / 4 / 6' , style: TextStyle(
//                     color : Colors.deepPurple,
//                     fontFamily: 'UbuntuMono-Regular' ,
//                     fontSize: 15.0
//                 ))
//               ]
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:alert_dialog/alert_dialog.dart';
import 'package:conditional/conditional.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/states.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/views/loginScreens/signInScreen.dart';
import 'package:shoppingapp/views/widgetsHepler/customTextField.dart';
import 'package:shoppingapp/views/widgetsHepler/profileItem.dart';

class ProfileScreen extends StatelessWidget {
  int themeValue = 1 ;
  int langValue = 1;
  var nameTextController = TextEditingController();
  var emailTextController = TextEditingController();
  var phoneTextController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
     listener: (context , state){},
      builder: (context, state){
       var profileData = ShoppingCubit.get(context);
       return Conditional(
         condition: profileData.userData == null,
         onConditionTrue: Center(
             child : CircularProgressIndicator(color: Theme.of(context).primaryColor)
         ),
         onConditionFalse: SingleChildScrollView(
           child: Form(
             key: _formKey,
             child: Column(
                 crossAxisAlignment: CrossAxisAlignment.stretch,
               children :[
                 Container(
                   padding: EdgeInsets.only(top: 40.0),
                   height :250 ,
                   child : Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: [
                       Container(
                         padding: EdgeInsets.all(20.0),
                         child: CircleAvatar(
                           backgroundColor: Colors.white,
                           radius: 80.0,
                           backgroundImage: AssetImage('assets/images/profile-image.png'),
                         ),
                       )
                     ],
                   )
                 ),
                 profileItem
                   (context,
                   profileData.userData.name,
                       (){ //okpresed
                     if (_formKey.currentState.validate()){
                       profileData.UpdateUserData('en', nameTextController.text, profileData.userData.email, profileData.userData.phone).then((value) {
                         Navigator.pop(context);
                       });
                     }
                   },
                       (value){},//onChange
                       (String value){
                     if (value.isEmpty){
                       return 'Name Must not be Empty';
                     }
                       },//validator
                   nameTextController,
                   'New UserName' ,
                   Icons.title,
                 ),
                 profileItem(context,
                     profileData.userData.email,
                     (){
                       profileData.UpdateUserData('en', profileData.userData.name, emailTextController.text, profileData.userData.phone).then((value) {
                         Navigator.pop(context);
                       });
                     }, //okpresed
                     (value){},//onChange
                       (String value){
                         if (value.isEmpty){
                           return 'Email Must Not be Empty';
                         }
                         else if (!EmailValidator.validate(value)){
                           return 'Email Not In Email Format';
                         }
                         else {
                           return null ;
                         }},//validator
                     emailTextController,
                     'New Email' ,
                      Icons.email,
                     ),
                 profileItem
                   (context,
                   profileData.userData.phone,
                       (){
                         if (_formKey.currentState.validate())
                            profileData.UpdateUserData('en', profileData.userData.name, profileData.userData.email, phoneTextController.text).then((value) {
                              Navigator.pop(context);
                         });
                   }, //okpresed
                       (value){},//onChange
                       (String value){
                         if (value.isEmpty) return 'Phone Must Not Be Empty.';
                         if (value.length < 11) return 'phone number must not be more than 11 number';
                         else
                           return null;
                       },//validator
                   phoneTextController,
                   'New phone Number' ,
                   Icons.phone_android,
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                   child: Row(
                     children: [
                       Expanded(
                         child: ListTile(
                           leading: Icon(Icons.brightness_4_outlined, size : 25.0 , color: Color(0xFF445A65),),
                           title: Text('Light' ,style: TextStyle(
                             fontFamily: 'Poppins-Regular',
                             fontSize: 17.0  ,
                             color: Color(0xFF445A65),
                           ),),
                         ),
                       ),
                       DropdownButton(
                         style:  TextStyle(
                         fontFamily: 'Poppins-Regular',
                         fontSize: 16.0  ,
                         color: Color(0xFF445A65),
                       ),
                         icon: Icon(Icons.arrow_drop_down , size: 25.0),
                         value: themeValue,
                         items: [
                           DropdownMenuItem(
                             child: Text('Light'),
                             value: 1,
                           ),
                           DropdownMenuItem(
                             child: Text('Dark'),
                             value: 2,
                           ),
                         ],
                           onChanged: (value) {
                             // setState(() {
                             //   _value = value;
                             // });
                           }
                       ),
                     ],
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
                   child: Row(
                     children: [
                       Expanded(
                         child: ListTile(
                           leading: Icon(Icons.language, size : 25.0 , color: Color(0xFF445A65),),
                           title: Text('Language' ,style: TextStyle(
                             fontFamily: 'Poppins-Regular',
                             fontSize: 17.0  ,
                             color: Color(0xFF445A65),
                           ),),
                         ),
                       ),
                       DropdownButton(
                           style:  TextStyle(
                             fontFamily: 'Poppins-Regular',
                             fontSize: 16.0  ,
                             color: Color(0xFF445A65),
                           ),
                           icon: Icon(Icons.arrow_drop_down , size: 25.0),
                           value: langValue,
                           items: [
                             DropdownMenuItem(
                               child: Text('English'),
                               value: 1,
                             ),
                             DropdownMenuItem(
                               child: Text('Arabic'),
                               value: 2,
                             ),
                           ],
                           onChanged: (value) {
                             // setState(() {
                             //   _value = value;
                             // });
                           }
                       ),
                     ],
                   ),
                 ),
                 SizedBox(height: 20.0),
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 25),
                   child: Container(
                     padding: EdgeInsets.symmetric(vertical: 3),
                     decoration: BoxDecoration(
                         color: Theme.of(context).primaryColor,
                         borderRadius:
                         BorderRadius.all(Radius.circular(10.0))),
                     child: TextButton(
                         onPressed: () async {
                           await profileData.logOut('en').then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){return SignInScreen();})));
                         },
                         child: Text(
                           'LogOut',
                           style: TextStyle(
                             fontFamily: 'Poppins_SemiBold' ,
                             fontSize: 20,
                             color: Colors.white,
                           ),
                         ))  ,
                   ),
                 ),
               ]
             ),
           ),
         ),
       );
      },
    );
  }
}


