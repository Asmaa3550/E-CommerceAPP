import 'package:conditional/conditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/shared/helperFunctions.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/states.dart';
import 'package:shoppingapp/shared/network/cachedHelper.dart';
import 'file:///F:/Courses/Flutter/My%20Own%20Projects/flutter_application_1/lib/views/home/homeScreen.dart';
import '../widgetsHepler/customTextField.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:email_validator/email_validator.dart';

import 'signUpScreen.dart';

class SignInScreen extends StatefulWidget {
  static const ID = 'SignInScreen';
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
   TextEditingController _emailController;
   TextEditingController _passwordController;
  var _formKey = GlobalKey<FormState>();
   String email = '';
   String password  = '';

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocProvider<LoginCubit>(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit , ShopLoginStates>(
        listener: (context , state){
          if (state is SuccLoginState){
              if (state.userData.status){
                  print(state.userData.message);
                  print(state.userData.data.token);
              }else {

              }
          }
        },
        builder : (context , state) {
          var cubit = LoginCubit.get(context);
          return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            if (EasyLocalization.of(context).currentLocale ==Locale('ar' , 'SA') ){
                              EasyLocalization.of(context).setLocale( Locale('en' , 'US'));
                            }
                            else {
                              EasyLocalization.of(context).setLocale( Locale('ar' , 'SA'));
                            }
                          });
                        },
                        child: Container(
                          alignment: Alignment.topLeft,
                          color: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(
                                Icons.language,
                                color : Colors.white
                            ),
                          ),
                        ),
                      ),
                      Container(
                          alignment: Alignment.center,
                          width: screenWidth,
                          height: screenHeight * 0.35,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/Vector.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Text('LOGIN'.tr().toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                  'Poppins_SemiBold' : 'Tajawal-Regular',
                                  fontWeight: FontWeight.w600))),
                      Form(
                        key : _formKey,
                        child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  TextInputField(
                                    controller : _emailController,
                                    prefixIcon: Icons.account_circle_rounded,
                                    hintText: 'Email Address'.tr().toString(),
                                    password: false ,
                                    onChange: (value){
                                      setState(() {
                                        email = value ;
                                      });
                                    },
                                    validator :(String value){
                                      print('in validator ====> ' + value);
                                      if (value.isEmpty){
                                        return 'Email Must Not be Empty';
                                      }
                                      else if (!EmailValidator.validate(email)){
                                        return 'Email Not In Email Format';
                                      }
                                      else {
                                        return null ;
                                      }
                                    },
                                  ),
                                  TextInputField(
                                    controller : _passwordController,
                                    prefixIcon: Icons.lock,
                                    hintText: 'Password'.tr().toString(),
                                    password: true,
                                    onChange: (value){
                                      setState(() {
                                        password = value ;
                                      });
                                    },
                                    validator :(String value){
                                      print('in validator ====> ' + value);
                                      if (value.isEmpty) return 'Password Must Not Be Empty.';
                                      else
                                        return null;
                                    },
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 35.0),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Text(
                                        'Forget Password?'.tr().toString(),
                                        style: TextStyle(
                                            fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                            'Poppins_Regular' : 'Tajawal-Regular',
                                            fontSize: 14,
                                            color: Color(0xFF868686)),
                                      ),
                                    ),
                                  ),
                                  Conditional(
                                    condition: state is LoadingLoginState,
                                    onConditionTrue: Center(child: CircularProgressIndicator(color: Theme.of(context).primaryColor)),
                                    onConditionFalse:  Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 22),
                                      child: Container(
                                      padding: EdgeInsets.symmetric(vertical: 3),
                                      decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                                      child: TextButton(
                                          onPressed: () async {
                                            if (_formKey.currentState.validate()){
                                              await cubit.userLogin(email: email, password: password  , lang: 'ar');
                                              if (cubit.user.status){
                                                ToastBuilder(message :  cubit.user.message , state : ToastColor.SUCCESS);
                                                navigatAndFinish(HomeScreen() , context);
                                              }else {
                                                ToastBuilder(message:cubit.user.message  , state : ToastColor.ERROR );
                                              }
                                            }
                                          },
                                          child: Text(
                                            'Login'.tr().toString(),
                                            style: TextStyle(
                                              fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                              'Poppins_SemiBold' : 'Tajawal-Regular',
                                              fontSize: 20,
                                              color: Colors.white,
                                            ),
                                          ))  ,
                                    ),
                                  ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 50, bottom: 10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Don’t Have an Account?'.tr().toString(),
                                          style: TextStyle(
                                              fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                              'Poppins_Regular' : 'Tajawal-Regular',
                                              fontSize: 15,
                                              color: Color(0xFF868686)),
                                        ),
                                        InkWell(
                                          onTap:(){
                                            Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen()));
                                          } ,
                                          child: Text(
                                            'SignUp'.tr().toString(),
                                            style: TextStyle(
                                                fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                                'Poppins_Bold' : 'Tajawal-Regular',
                                                fontSize: 15,
                                                fontWeight: FontWeight.w800,
                                                color: Color(0xFF868686)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Join With'.tr().toString(),
                                        style: TextStyle(
                                          fontFamily: EasyLocalization.of(context).currentLocale == Locale('en' , 'US') ?
                                          'Poppins_Regular' : 'Tajawal-Regular',
                                          fontSize: 15,
                                          color: Color(0xFF595959),
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Color(0xFFC5331E),
                                          child: Text(
                                            'G',
                                            style: TextStyle(
                                                fontFamily: 'Poppins_Regular',
                                                fontWeight: FontWeight.w500,
                                                fontSize: 25,
                                                color: Colors.white),
                                          )),
                                      SizedBox(width: 10),
                                      InkWell(
                                        onTap: (){

                                        },
                                        child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: Color(0xFF3B5998),
                                            child: Text(
                                              'f',
                                              style: TextStyle(
                                                  fontFamily: 'Poppins_Regular',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 27,
                                                  color: Colors.white),
                                            )),
                                      ) ,

                                    ],
                                  ) ,

                                ])
                        ),
                      )
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
