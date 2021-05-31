import 'package:conditional/conditional.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/views/widgetsHepler/favoriteCard.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShoppingCubit , ShoppingStates>(
        listener: (context , state){} ,
        builder: (context , state){
          var favCubit = ShoppingCubit.get(context).favoritesProducts;
          return  Conditional(
            condition: favCubit.data == null,
            onConditionTrue: Center(
              child: CircularProgressIndicator(),
            ),
            onConditionFalse:ListView.builder(
                itemCount: favCubit.data.data.length,
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 20.0 ,top :20 ,  right: 20.0 , bottom: 60.0),
                itemBuilder: (context , index){
                  return  favoriteCard( favCubit.data.data[index].product, context , true);
                }),
          ) ;
        },
    );
  }
}
