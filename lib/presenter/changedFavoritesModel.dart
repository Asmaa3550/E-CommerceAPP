
class ChangeFavorite{
  bool status ;
  String message ;


  ChangeFavorite.fromJson(Map json){
    status = json['status'];
    message = json['message'];
  }
}