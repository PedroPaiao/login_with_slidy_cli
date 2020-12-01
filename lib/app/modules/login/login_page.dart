import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_auth_slidy/app/modules/login/widgets/form_login/form_login_widget.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FormLoginWidget(onPressed: () {
              controller.login();
            }),
            Observer(
              builder: (_) {
                if (controller.state is None) {
                  return Container();
                } else if (controller.state is Loading) {
                  return CircularProgressIndicator();
                } else if (controller.state is Success) {
                  return Text("Bem-vindo ao App");
                } else {
                  return Text("Email e/ou senha invalido(s).");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
