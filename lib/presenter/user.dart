class UserData {
   int id;
   String name;
   String email ;
   String phone;
   String image;
   String token ;

   UserData.setData (Map json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'].toString();
    image = json['image'];
    token = json['token'];
  }
}


class LoginData {
   bool status ;
   String message ;
   UserData data ;

  LoginData.data(Map json){
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ?
        UserData.setData(json['data']) : null;
  }
}