import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:shoppingapp/shared/constents.dart';
import 'package:shoppingapp/shared/network/cachedHelper.dart';
import 'package:shoppingapp/shared/network/dioHelper.dart';
import 'package:shoppingapp/shared/themes.dart';
import 'file:///F:/Courses/Flutter/My%20Own%20Projects/flutter_application_1/lib/presenter/bloc/blocObserver.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'views/loginScreens/welcomeScreen.dart';
import 'views/loginScreens/signInScreen.dart';
import 'views/loginScreens/signUpScreen.dart';
import 'views/productScreen.dart';
import 'views/home/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CachedHelper.init();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  var onBoarding = await CachedHelper.getData('onBoarding');
  token = await CachedHelper.getData('token');
  print(token);
  Widget startScreen;

  if (onBoarding != null) {
    if (token != null) {
      startScreen = HomeScreen();
    } else {
      startScreen = SignInScreen();
    }
  } else {
    startScreen = WelcomeScreen();
  }
  runApp(EasyLocalization(
      supportedLocales: [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/langs',
      fallbackLocale: Locale('en', 'US'),
      saveLocale: true,
      child: MyApp(startScreen)));
}

class MyApp extends StatelessWidget {
  final Widget startScreen;
  MyApp(this.startScreen);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingCubit>(
          create: (context) => ShoppingCubit()..getCategories('en')..getHomeData('en')..getFavorites('en')..getUserData('en'),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: lightTheme,
        home: startScreen,
        routes: {
          WelcomeScreen.ID: (context) => WelcomeScreen(),
          SignInScreen.ID: (context) => SignInScreen(),
          SignUpScreen.ID: (context) => SignUpScreen(),
          ProductScreen.ID: (context) => ProductScreen(),

        },
      ),
    );
  }
}
