import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/views/widgetsHepler/customAppBar.dart';

class HomeScreen extends StatelessWidget {
  var appBarHeight = AppBar().preferredSize.height;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocConsumer<ShoppingCubit, ShoppingStates>(
          listener: (context, state) {},
          builder: (context, state) {
            var cubit = ShoppingCubit.get(context);
            return Scaffold(
                extendBody: true,
                backgroundColor: Colors.white,
                appBar: cubit.currentIndex == 0  ? PreferredSize(
                    preferredSize: Size.fromHeight(appBarHeight + appBarHeight / 2),
                    child: CustomAppBar(title: 'Hello Asmaa', withIcon: true)) : null,
                bottomNavigationBar: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Colors.white),
                      child: BottomNavigationBar(
                          showUnselectedLabels: true,
                        backgroundColor: Colors.white,
                        selectedItemColor:  Color(0xff025955),
                        unselectedItemColor: Color(0xff025955).withOpacity(.30),
                        selectedFontSize: 12,
                        onTap: (index) {
                          cubit.changeBottomNavigationBarIndex(index);
                        },
                        currentIndex: cubit.currentIndex,
                        items: cubit.items
                      )),
                ),
                body: cubit.screens[cubit.currentIndex]);
          },
        ));
  }
}
