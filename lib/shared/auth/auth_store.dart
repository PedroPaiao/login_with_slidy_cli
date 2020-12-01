import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_auth_slidy/shared/models/user_model.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase extends Disposable with Store {
  @observable
  UserModel _user;

  ReactionDisposer _disposer;

  _AuthStoreBase() {
    _disposer = autorun((_) {
      if (_user != null) {
        // Eu uso esse metodo para garantit que quando eu der um pop por exemplo
        // o usurio não voltará para a splash screen por exemplo.
        Modular.to.pushReplacementNamed('/home');
      } else {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }

  @action
  void logged(UserModel user) {
    this._user = user;
  }

  @action
  void logout() {
    this._user = null;
  }

  UserModel get currentUser => this._user;

  @override
  void dispose() {
    _disposer();
  }
}
