import 'package:login_auth_slidy/app/modules/splash/splash_controller.dart';
import 'package:login_auth_slidy/app/modules/splash/splash_page.dart';
import 'package:login_auth_slidy/shared/auth/auth_store.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:login_auth_slidy/app/app_widget.dart';
import 'package:login_auth_slidy/app/modules/home/home_module.dart';

import 'modules/login/login_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthStore()),
        Bind((i) => SplashController()),
        $AppController,
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, __) => SplashPage()),
        ModularRouter('/login', module: LoginModule()),
        ModularRouter('/home', module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
