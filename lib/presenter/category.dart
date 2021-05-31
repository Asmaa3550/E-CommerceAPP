class CategoriesModel {
  List <Category> data = [];


  CategoriesModel.fromJson(Map json){
    json['data']['data'].forEach((element) {
      data.add(Category.fromJson(element));
    });
  }

}

class Category {
  String image ;
  String name ;
  int id;

  Category.fromJson(Map json ){
      id = json['id'] ;
      name = json['name'] ;
      image = json['image'] ;
  }

  // Category fromJson(Map value) {}
}