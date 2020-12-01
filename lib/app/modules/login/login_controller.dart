import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'login_state.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  LoginState state = None();

  @action
  Future<void> login() async {
    state = Loading();
    await Future.delayed(Duration(seconds: 2));
    state = Success();
  }
}
