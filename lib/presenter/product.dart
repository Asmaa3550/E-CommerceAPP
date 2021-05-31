class HomeModel {
  bool status;
  HomeDataModel data;

  HomeModel.formJson(Map json) {
    status = json['status'];
    data = HomeDataModel.fromJson(json['data']);
  }
}

class HomeDataModel {
  List<Banner> banners = [];
  List<Product> products = [];
  HomeDataModel.fromJson(Map json) {
    json['banners'].forEach((element) {
      banners.add(Banner.fromJson(element));
    });
    json['products'].forEach((element) {
      products.add(Product.fromJson(element));
    });
  }
}

class Banner {
  double id;
  String image;

  Banner.fromJson(Map json) {
    id = double.parse(json['id'].toString());
    image = json['image'];
  }
}

class Product {
  int id;
  String name;
  String image ;
  double price;
  double oldPrice;
  double discount;
  bool fav;
  bool cart;

  Product.fromJson(Map json) {
    id = json['id'];
    name = json['name'];
    price = double.parse(json['price'].toString());
    oldPrice = double.parse(json['old_price'].toString());
    image = json['image'];
    discount = double.parse(json['discount'].toString());
    fav = json['in_favorites'];
    cart = json['in_cart'];
  }
}

