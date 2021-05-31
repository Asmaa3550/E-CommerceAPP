import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:shoppingapp/shared/constents.dart';
import 'package:shoppingapp/shared/network/dioHelper.dart';
import 'package:shoppingapp/presenter/bloc/login_bloc/states.dart';
import '../../user.dart';
import '../endPoints.dart';
import 'package:shoppingapp/shared/network/cachedHelper.dart';

class LoginCubit extends Cubit<ShopLoginStates> {
  LoginCubit() : super(InitialLoginState());
  static LoginCubit get(context) => BlocProvider.of<LoginCubit>(context);
  String userName;
  String email;
  LoginData user;
  UserData userData ;


  Future userLogin(
      {@required String email, @required String password, String lang}) async {
    emit(LoadingLoginState());

    await DioHelper.postData(
      lang: lang,
      url: LOGIN,
      data: {'email': email, 'password': password},
    ).then((value) {
      user = LoginData.data(value);
      token = user.data.token ;
      CachedHelper.saveData('token', user.data.token);
      print(token);
      emit(SuccLoginState(user));
    }).catchError((error) {
      print(error.toString());
      emit(FailedLoginState(error));
    });

    var t = await  CachedHelper.getData('token');
    print('the saved token after login ' + t.toString());
  }

  Future register(name, email, phone, password) async {
    emit(LoadingRegisterState());

    await DioHelper.postData(url: REGISTER, data: {
      'name': name,
      'phone': phone,
      'email': email,
      'password': password,
      'image': name
    }).then((value) {
      print(value);
      user = LoginData.data(value);
      CachedHelper.saveData('token', user.data.token);
      emit(SuccRegisterState(user));
    }).catchError((error) {
      print(error);
      emit(FailedRegisterState());
    });
  }

  // Future getUserData (String lang)async{
  //   print('From cubit=====================================================================================');
  //   emit(GetDataOfUserLoadingState());
  //   await DioHelper.getData(
  //       url: PROFILE ,
  //       lang :lang ,
  //       token : token)
  //       .then((value) {
  //     userData = UserData.setData(value['data']);
  //     print(userData.name);
  //     emit(GetDataOfUserSuccState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(GetDataOfUserErrorState(error));
  //   });
  // }
  // Future UpdateUserData (
  //     String lang ,
  //     @required String name ,
  //     @required String userEmail ,
  //     @required String phone ,
  //     )async{
  //   await DioHelper.putData(
  //       data: {
  //         'name' : name ,
  //         'email' : userEmail ,
  //         'phone' : phone
  //       },
  //       url: UPDATE_PROFILE ,
  //       lang :lang ,
  //       token : token)
  //       .then((value) {
  //     userData = UserData.setData(value['data']);
  //     print(userData.name);
  //     emit(UpdateDataOfUserSuccState());
  //   }).catchError((error) {
  //     print(error);
  //     emit(UpdateDataOfUserErrorState(error));
  //   });
  // }
}
