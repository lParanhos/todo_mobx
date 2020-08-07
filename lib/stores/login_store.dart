import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    // Sempre que um dos observables que estão dentro do autorun forem
    //modificados, ele executa a função. No caso printa email e password
    autorun((_) {
      print(email);
      print(password);
    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;
}
