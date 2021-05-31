import 'package:flutter/material.dart';
import 'package:shoppingapp/shared/helperFunctions.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/cubit.dart';
import 'package:shoppingapp/presenter/product.dart';

Widget CardItem(Product model, context) {
  return Material(
    elevation: 10,
    borderRadius: BorderRadius.circular(10),
    child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey[200],
              blurRadius: 3,
              offset: Offset(1, 0),
            ),
          ],
        ),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            model.discount != 0
                ? Align(
                  alignment: AlignmentDirectional.topStart,
                  child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 7.0),
                          color: Colors.red,
                          child: Text('DISCOUNT',
                              style: TextStyle(color: Colors.white))),
                    ),
                )
                : Text(''),

            Expanded(
              flex: 3,
              child: Image(
                image: NetworkImage(model.image),
                // fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(model.name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins_Regular',
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    )),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Text(' ${model.price.round().toString()}',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontFamily: 'Poppins_Regular',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      )),
                  SizedBox(width: 5),
                  model.discount != 0
                      ? Text('${model.oldPrice.round().toString()}',
                          style: TextStyle(
                              color: Colors.red,
                              fontFamily: 'Poppins_Regular',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              decoration: TextDecoration.lineThrough))
                      : Text(''),
                  Spacer(),
                  IconButton(
                    onPressed: ()async{
                     await ShoppingCubit.get(context).changeFavorites(model.id, 'en');
                     if (ShoppingCubit.get(context).changedFavoriteModel.status)
                        ToastBuilder(message : ShoppingCubit.get(context).changedFavoriteModel.message , state : ToastColor.WARNING);
                     else
                       ToastBuilder(message : ShoppingCubit.get(context).changedFavoriteModel.message , state : ToastColor.ERROR);
                    },
                    icon: Icon(ShoppingCubit.get(context).favorites[model.id] ?
                        Icons.favorite :
                        Icons.favorite_border,
                        color: Theme.of(context).primaryColor),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}
