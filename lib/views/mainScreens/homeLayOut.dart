import 'package:conditional/conditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/views/widgetsHepler/CardItem.dart';
import 'package:shoppingapp/views/widgetsHepler/bannerBuilder.dart';
import 'package:shoppingapp/views/widgetsHepler/categoryItem.dart';

import 'searchScreen.dart';

class HomeLayOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var dataCubit = ShoppingCubit.get(context);
          return Conditional(
            condition: dataCubit.homeModel != null,
            onConditionTrue: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  // Search Txt feild .
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: TextField(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
                      },
                      // enabled: false,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(vertical: 5),
                          hintText: 'Search for product ',
                          hintStyle: TextStyle(
                              color: Theme.of(context).secondaryHeaderColor,
                              fontFamily: 'Poppins_Regular',
                              fontSize: 16),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Icon(Icons.search,
                                size: 30,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                          focusedBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).secondaryHeaderColor)),
                          border: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color: Theme.of(context).secondaryHeaderColor)),
                          enabledBorder: new OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(25)),
                              borderSide: BorderSide(
                                  color:
                                      Theme.of(context).secondaryHeaderColor)) ,
                        disabledBorder: new OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            borderSide: BorderSide(
                                color:
                                Theme.of(context).secondaryHeaderColor)) ,
                      ),
                    ),
                  ),
                  // Categories bar .
                  dataCubit.categoryModel != null ?Container(
                    height: 75,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: dataCubit.categoryModel.data.length,
                        itemBuilder: (context, index) {
                          return categoryItem(dataCubit.categoryModel.data[index]);
                        },
                      ),
                    ),
                  ) : CircularProgressIndicator(),
                  // Banners List .
                  dataCubit.homeModel != null
                      ? bannerBuilder(screenWidth, screenHeight,
                          dataCubit.homeModel.data.banners)
                      : Center(child: CircularProgressIndicator()),
                  // Products List .
                  dataCubit.homeModel != null
                      ? Container(
                          padding: EdgeInsets.only(bottom: 20.0 , top :40.0),
                          width: screenWidth,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(28.0),
                                  topRight: Radius.circular(28.0)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey[500],
                                  offset: Offset(0, 7.0),
                                  blurRadius: 20.0,
                                ),
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/images/Vecto3r.png'),
                                  alignment: Alignment.topRight,
                                  scale: 0.5)),
                          child: GridView.count(
                            padding: EdgeInsets.symmetric(horizontal: 10.0),
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              crossAxisCount: 2,
                              mainAxisSpacing: 15,
                              crossAxisSpacing: 10,
                              childAspectRatio: 0.6,
                              children: List.generate(
                                  dataCubit.homeModel.data.products.length,
                                  (index) {
                                return CardItem(
                                    dataCubit.homeModel.data.products[index],
                                    context);
                              })))
                      : Center(child: CircularProgressIndicator()),

                    ])
            ),
            onConditionFalse: Center(
              child : CircularProgressIndicator(color: Theme.of(context).primaryColor)
            ),
          );
        });
  }
}


