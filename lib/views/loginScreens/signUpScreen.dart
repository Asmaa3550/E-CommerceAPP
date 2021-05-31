import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/states.dart';
import '../widgetsHepler/customTextField.dart';


class SignUpScreen extends StatefulWidget {
  static const String ID = 'SignUpScreen';

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var _formKey  = GlobalKey<FormState>();

  String name ;
  String email ;
  String phone ;
  String image ;
  String token ;
  String password ;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<LoginCubit , ShopLoginStates>(
      listener: (context  , state ){},
      builder: (context , state ){
        return  SafeArea(
            child :Scaffold (
              backgroundColor: Colors.white,
              appBar : AppBar(backgroundColor: Theme.of(context).primaryColor,),
              body: SingleChildScrollView(
                child: Column(
                  children: [
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
                        child: Text('SignUp',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 28,
                                fontFamily: 'Poppins_SemiBold',
                                fontWeight: FontWeight.w600))),
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Form(
                          key : _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextInputField(
                                // prefixIcon: Icons.,
                                hintText: 'Full Name',
                                password: false ,
                                onChange: (value){
                                  setState(() {
                                    name  = value ;
                                  });
                                },
                                validator: (String value){
                                  if (value.isEmpty)
                                    return 'name must not be empty ';

                                },),
                              TextInputField(
                                // prefixIcon: Icons.,
                                  hintText: 'Email Address',
                                  password: false ,
                                  onChange: (value){
                                    setState(() {
                                      email  = value ;
                                    });

                                  },
                                  validator: (value){
                                    if (value.isEmpty)
                                      return 'name must not be empty ';
                                    else if (!EmailValidator.validate(email)){
                                      return 'Email Not In Email Format';
                                    }
                                    else {
                                      return null ;
                                    }
                                  }),
                              TextInputField(
                                // prefixIcon: Icons.,
                                  hintText: 'Phone',
                                  password: false ,
                                  onChange: (value){
                                    setState(() {
                                      phone  = value ;
                                    });
                                  },
                                  validator: (String value){
                                    if (value.isEmpty)
                                      return 'phone number must not be empty ';
                                  }),
                              TextInputField(
                                onChange: (value ){
                                  setState(() {
                                    password  = value ;
                                  });
                                },
                                // prefixIcon: Icons.,
                                  hintText: 'Password',
                                  password: true ,
                                  validator: (String value){
                                    if (value.isEmpty)
                                      return 'password must not be empty ';
                                    else if (value.length < 5 )
                                      return 'password must bigger then 4 letters ';
                                  }),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
                                child: Container(
                                  padding: EdgeInsets.symmetric(vertical: 3),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(24))),
                                  child: FlatButton(
                                      onPressed: () async {
                                        if (_formKey.currentState.validate()){
                                          await LoginCubit.get(context).register(name , email , phone , password);

                                        }
                                      },
                                      child: Text(
                                        'Submit',
                                        style: TextStyle(
                                          fontFamily: 'Poppins_SemiBold',
                                          fontSize: 20,
                                          color: Colors.white,
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        )
                    ),
                  ],
                ),
              ),
            )
        );
      },
    );
  }
}
