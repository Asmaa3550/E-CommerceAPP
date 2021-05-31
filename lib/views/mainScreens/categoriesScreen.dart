import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';

Random random = new Random();
class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit, ShoppingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var categories = ShoppingCubit.get(context).categoryModel.data;
          return Container(
              child: GridView.count(
              crossAxisCount: 2,
              physics: BouncingScrollPhysics(),
              crossAxisSpacing: 26.0,
              mainAxisSpacing: 26.0,
              padding: EdgeInsets.all(25.0),
              childAspectRatio: 1.2,
              children: List.generate(categories.length, (index) {
                int randomNumber = random.nextInt(6);
                return  Container(
                  padding : EdgeInsets.all(13.0),
                  alignment: AlignmentDirectional.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0) ,
                    image : DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: new ColorFilter.mode(
                            Colors.black.withOpacity(0.6),
                            BlendMode.hardLight),
                        image: NetworkImage(categories[index].image)

                    )
                  ),
                  child : Text(categories[index].name , style : TextStyle(
                    color: Colors.white ,
                    fontSize: 24 ,
                    fontWeight: FontWeight.w600 ,
                    fontFamily : 'Oswald-Bold'
                  ))
                );
              }),
          ));
        });
  }
}
