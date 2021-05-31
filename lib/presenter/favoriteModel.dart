import 'package:shoppingapp/presenter/product.dart';

class FavoritesModel {
  bool status;
  Null message;
  Data data;

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<productModelData> data = [];
  Data.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(new productModelData.fromJson(v));
      });
    }

  }

}

class productModelData {
  int id;
  Product product;

  productModelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
    json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

}

// class Product {
//   int id;
//   double price;
//   double oldPrice;
//   double discount;
//   String image;
//   String name;
//   String description;
//
//
//   Product.fromJson(Map<String, dynamic> json) {
//
//     id = json['id'];
//     price = double.parse(json['price'].toString());
//     oldPrice = double.parse(json['old_price'].toString());
//     discount = double.parse(json['discount'].toString());
//     image = json['image'];
//     name = json['name'];
//     description = json['description'];
//   }
//
// }