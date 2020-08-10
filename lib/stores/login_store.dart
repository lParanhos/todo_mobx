import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  _LoginStore() {
    // Sempre que um dos observables que estão dentro do autorun forem
    //modificados, ele executa a função. No caso printa email e password
    autorun((_) {
      /* print(email);
      print(password); */
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

   @observable
  bool showPassword = false;

  @action
  void toggleShowPassword() => showPassword = !showPassword; 

  @observable 
  bool loading = false;

  @computed
  bool get isEmailValid => 
    RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
      .hasMatch(email);

  @computed
  bool get isPasswordValid => password.length > 6;

  @computed
  Function get loginPressed => 
    (isEmailValid && isPasswordValid && !loading) ? login : null;
  

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
  }
}
