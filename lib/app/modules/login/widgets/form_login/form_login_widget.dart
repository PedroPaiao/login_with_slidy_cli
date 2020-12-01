import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_auth_slidy/app/modules/login/widgets/form_login/form_login_controller.dart';

class FormLoginWidget extends StatefulWidget {
  final VoidCallback onPressed;

  const FormLoginWidget({Key key, this.onPressed}) : super(key: key);
  @override
  _FormLoginWidgetState createState() => _FormLoginWidgetState();
}

class _FormLoginWidgetState
    extends ModularState<FormLoginWidget, FormLoginController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(children: [
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
                hintText: "Password", errorText: controller.validatePassword),
          ),
        ),
        SizedBox(height: 26),
        RaisedButton(child: Text("Entrar"), onPressed: widget.onPressed),
      ]),
    );
  }
}
