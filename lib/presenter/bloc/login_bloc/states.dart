import '../../user.dart';
abstract class ShopLoginStates {}

class InitialLoginState extends ShopLoginStates{}

class SuccLoginState extends ShopLoginStates{
  LoginData userData ;
  SuccLoginState(this.userData);
}
class LoadingLoginState extends ShopLoginStates{}
class FailedLoginState extends ShopLoginStates{
  final String error ;

  FailedLoginState(this.error);

}
class UpdateUserDataState extends ShopLoginStates{}

class LoadingRegisterState extends ShopLoginStates{}
class SuccRegisterState extends ShopLoginStates{
  LoginData userData ;
  SuccRegisterState(this.userData);

}
class FailedRegisterState extends ShopLoginStates{}

