import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/presenter/user.dart';
import 'package:shoppingapp/shared/constents.dart';
import 'package:shoppingapp/presenter/bloc/shoppingData_bloc/states.dart';
import 'package:shoppingapp/presenter/category.dart';
import 'package:shoppingapp/presenter/favoriteModel.dart';
import 'package:shoppingapp/presenter/product.dart';
import 'package:shoppingapp/shared/network/cachedHelper.dart';

import 'package:shoppingapp/views/mainScreens/categoriesScreen.dart';
import 'package:shoppingapp/views/mainScreens/favoriteScreen.dart';
import 'package:shoppingapp/views/mainScreens/homeLayOut.dart';
import 'package:shoppingapp/views/mainScreens/profileScreen.dart';

import '../../../shared/network/dioHelper.dart';

import '../../changedFavoritesModel.dart';
import '../../searchModel.dart';
import '../endPoints.dart';

class ShoppingCubit extends Cubit<ShoppingStates> {
  ShoppingCubit() : super(ShoppingInitialState());

  static ShoppingCubit get(context) => BlocProvider.of(context);

  HomeModel homeModel;
  CategoriesModel categoryModel;
  Map<int, bool> favorites = {};
  int currentIndex = 0;
  ChangeFavorite changedFavoriteModel ;
  FavoritesModel favoritesProducts ;
  UserData userData ;
  SearchModel searchModel ;


  List<Widget> screens = [
    HomeLayOut(),
    CategoryScreen(),
    ProfileScreen(),
    FavoritesScreen(),
  ];
  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(
      label: 'Home',
      icon: Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      label: 'Categories',
      icon: Icon(Icons.apps),
    ),
    BottomNavigationBarItem(
      label: 'Profile',
      icon: Icon(Icons.account_circle_rounded),
    ),
    BottomNavigationBarItem(
      label: 'Favorite',
      icon: Icon(Icons.favorite),
    ),
  ];

  void changeBottomNavigationBarIndex(int index) {
    this.currentIndex = index;
    emit(ChangeBottomNavigationIndexState(currentIndex));
  }

  Future getHomeData(String lang) async {
    emit(ShopLoadingHomeData());
    await DioHelper.getData(url: HOME, lang: lang, token: token).then((value) {
      homeModel = HomeModel.formJson(value);
      homeModel.data.products.forEach((element) {
        favorites.addAll({element.id: element.fav});
      });
      emit(ShopSuccHomeData(homeModel: homeModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeData());
    });
  }

  Future getCategories(String lang) async {
    await DioHelper.getData(url: CATEGORY, lang: lang).then((value) {
      categoryModel = CategoriesModel.fromJson(value);
      emit(CategorySuccState());
    }).catchError((error) {
      print(error);
      emit(CategoryErrorState());
    });
  }

  Future getFavorites(String lang) async {
    emit(GetFavoriteLoadingState());
    await DioHelper.getData(
        url: FAVORITE ,
        lang :lang ,
        token : token)
        .then((value) {
      favoritesProducts = FavoritesModel.fromJson(value);
      emit(GetFavoriteSuccState());
    }).catchError((error) {
      print(error);
      emit(GetFavoritesErrorState());
    });
  }

  Future changeFavorites(int id, String lang) async {
    favorites[id] = !favorites[id];
    emit(ChangeFavoriteSuccState());
     await DioHelper.postData(
        url: FAVORITE,
        data: {'product_id': id} ,
        lang: lang ,
        token : token
    )
          .then((value) {
       changedFavoriteModel = ChangeFavorite.fromJson(value);

            if (changedFavoriteModel.status == false)
              favorites[id] = !favorites[id];
            else
              getFavorites(lang);

            print(changedFavoriteModel.message);
            print(value['message']);
          emit(ChangeFavoriteSuccState());

        }).catchError((error) {
      print(error);
      emit(ChangeFavoritesErrorState());
    });
  }

  Future getUserData (String lang)async{
    emit(GetDataOfUserLoadingState());
    await DioHelper.getData(
        url: PROFILE ,
        lang :lang ,
        token : token)
        .then((value) {
      userData = UserData.setData(value['data']);
      print(userData.name);
      emit(GetDataOfUserSuccState());
    }).catchError((error) {
      print(error);
      emit(GetDataOfUserErrorState(error));
    });
  }

  Future UpdateUserData (
      String lang ,
      @required String name ,
      @required String userEmail ,
      @required String phone ,
      )async{
    await DioHelper.putData(
        data: {
          'name' : name ,
          'email' : userEmail ,
          'phone' : phone
        },
        url: UPDATE_PROFILE ,
        lang :lang ,
        token : token)
        .then((value) {
      userData = UserData.setData(value['data']);
      print(userData.name);
      emit(UpdateDataOfUserSuccState());
    }).catchError((error) {
      print(error);
      emit(UpdateDataOfUserErrorState(error));
    });
  }
  Future logOut(String lang) async {

    await DioHelper.postData(
        url: LOGOUT ,
        lang :lang ,
        token : token)
        .then((value) {
          CachedHelper.clearData('token');
          CachedHelper.clearData('onBoarding');
      emit(LogOutSuccState());
    }).catchError((error) {
      print(error);
      emit(LogOutErrorState(error));
    });
  }

  Future searchProduct (String lang , String text)async{
    emit(SearchProductLoadingState());
    if (searchModel != null)
      {
        searchModel.data.data.clear();
      }
    await DioHelper.postData(
        url: SEARCH ,
        lang :lang ,
        token : token ,
        data : {'text' : text})
        .then((value) {
          // print(value['data']['data']);
          searchModel = SearchModel.fromJson(value);
          print(searchModel.data.data[0].name);
      emit(SearchProductSuccState());
    }).catchError((error) {
      print(error);
      emit(SearchProductErrorState());
    });
  }
}
