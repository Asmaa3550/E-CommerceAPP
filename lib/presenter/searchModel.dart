import 'package:shoppingapp/presenter/product.dart';

class SearchModel {
  bool status;
  Null message;
  SearchData data;
  SearhModel(){}
  SearchModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new SearchData.fromJson(json['data']) : null;
  }

}

class SearchData {
  List<productData> data = [];

  SearchData.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      json['data'].forEach((v) {
        print('inSide the model ==== ' + v.toString());
        data.add(new productData.fromJson(v));
      });
    }
  }
}

class productData {
  int id;
  double price;
  String image;
  String name;
  String description;
  List<String> images;
  bool inFavorites;
  bool inCart;

  productData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = double.parse(json['price'].toString());
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}