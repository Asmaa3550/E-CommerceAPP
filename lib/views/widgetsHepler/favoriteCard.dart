import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/helperFunctions.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';


Widget favoriteCard ( productModel , context , bool isFav ) {

    return Padding(
    padding: const EdgeInsets.only(bottom:15.0),
    child: Container(
        padding : EdgeInsets.symmetric(vertical: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 5,
              offset: Offset(2, 0),
            ),
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        height: 185,
        child: Row(
            children: [
          Expanded(
            child: Image(
                image: NetworkImage(productModel.image),
               ),
          ),
          // SizedBox(width : 5.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              isFav && productModel.discount !=0 ? Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 7.0),
                        color: Colors.red,
                        child: Text('DISCOUNT',
                            style: TextStyle(color: Colors.white))),
                  ),
                ) : Text(''),
                SizedBox(height: 10.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(productModel.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins_Regular',
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                         Text(productModel.price.toString(),
                             style: TextStyle(
                               color: Theme.of(context).primaryColor,
                               fontFamily: 'Poppins_Regular',
                               fontSize: 18,
                               fontWeight: FontWeight.w600,
                             )),

                            isFav && productModel.discount != 0 ? Text( productModel.oldPrice.toString(),
                               style: TextStyle(
                                   color: Colors.red,
                                   fontFamily: 'Poppins_Regular',
                                   fontSize: 13,
                                   fontWeight: FontWeight.w600,
                                   decoration: TextDecoration.lineThrough)) : Text(''),
                       ],),
                        if (ShoppingCubit.get(context).favorites.containsKey(productModel.id))
                        IconButton(
                          onPressed: ()async{
                            await ShoppingCubit.get(context).changeFavorites(productModel.id, 'en');

                            if (ShoppingCubit.get(context).changedFavoriteModel.status)
                              ToastBuilder(message : ShoppingCubit.get(context).changedFavoriteModel.message , state : ToastColor.WARNING);
                            else
                              ToastBuilder(message : ShoppingCubit.get(context).changedFavoriteModel.message , state : ToastColor.ERROR);
                          },
                          icon :
                          Icon(
                            ShoppingCubit.get(context).favorites[productModel.id] ?
                            Icons.favorite :
                              Icons.favorite_border,
                              color: Theme.of(context).primaryColor),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ])),
  );}
