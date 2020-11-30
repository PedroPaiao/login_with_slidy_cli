import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'login_controller.dart';

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
            Observer(
              builder: (_) => TextField(
                onChanged: controller.saveEmail,
                decoration: InputDecoration(
                    hintText: "Email", errorText: controller.validateEmail),
              ),
            ),
            Observer(
              builder: (_) => TextField(
                onChanged: controller.savePassword,
                decoration: InputDecoration(
                    hintText: "Password",
                    errorText: controller.validatePassword),
              ),
            ),
            SizedBox(height: 26),
            RaisedButton(onPressed: () {}, child: Text("Entrar"))
          ],
        ),
      ),
    );
  }
}
