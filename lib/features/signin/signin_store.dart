import 'package:mobx/mobx.dart';

part 'signin_store.g.dart';

class SigninStore = _SigninStoreBase with _$SigninStore;

abstract class _SigninStoreBase with Store {
  @observable
  String email = "";
  
  @observable
  String password = "";
  Future<void> signin() async {}
}
