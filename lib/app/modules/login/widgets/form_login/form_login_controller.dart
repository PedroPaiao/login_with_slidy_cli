import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'form_login_controller.g.dart';

@Injectable()
class FormLoginController = _FormLoginControllerBase with _$FormLoginController;

abstract class _FormLoginControllerBase with Store {
  @observable
  String email = "";

  @observable
  String password = "";

  @computed
  String get validateEmail => email.contains("@") ? null : "Email invalido";

  @computed
  String get validatePassword =>
      password.length > 6 ? null : "Senha deve conter no minimo 6 caracteres";

  @action
  void saveEmail(value) => email = value;

  @action
  void savePassword(value) => password = value;
}
