import 'package:shoppingapp/presenter/product.dart';
import 'package:shoppingapp/presenter/user.dart';

abstract class ShoppingStates {}

class ShoppingInitialState extends ShoppingStates {}

class ChangeBottomNavigationIndexState extends ShoppingStates {
  final int newIndex ;

  ChangeBottomNavigationIndexState(this.newIndex);

}

class ShopLoadingHomeData extends ShoppingStates {}
class ShopSuccHomeData extends ShoppingStates {
  HomeModel homeModel;

  ShopSuccHomeData({this.homeModel});
}
class ShopErrorHomeData extends ShoppingStates {}



class CategorySuccState extends ShoppingStates {}
class CategoryErrorState extends ShoppingStates {}


class ChangeFavoriteSuccState extends ShoppingStates {}
class ChangeFavoritesErrorState extends ShoppingStates {}

class GetFavoriteLoadingState extends ShoppingStates {}
class GetFavoriteSuccState extends ShoppingStates {}
class GetFavoritesErrorState extends ShoppingStates {}


class GetDataOfUserLoadingState extends ShoppingStates{}
class GetDataOfUserSuccState extends ShoppingStates{}
class GetDataOfUserErrorState extends ShoppingStates{
  LoginData userData ;
  GetDataOfUserErrorState(this.userData);

}

class UpdateDataOfUserSuccState extends ShoppingStates{}
class UpdateDataOfUserErrorState extends ShoppingStates {
  LoginData userData;

  UpdateDataOfUserErrorState(this.userData);
}

class LogOutSuccState extends ShoppingStates{}
class LogOutErrorState extends ShoppingStates {
  LoginData userData;

  LogOutErrorState(this.userData);
}


class SearchProductSuccState extends ShoppingStates{}
class SearchProductErrorState extends ShoppingStates{}
class SearchProductLoadingState extends ShoppingStates{}

