
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

import '../../AppTheme.dart';

class AuthPasswordPage extends BaseStateFulWidget {

  final String title = "Auth Password Page";
  String strCodeAuth;

  AuthPasswordPage(this.strCodeAuth, {Key? key, DbNavigation? nav}) : super(key: key, nav: nav);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }

}

class _ForgotPasswordPageState extends State<AuthPasswordPage> {

  TextEditingController emailController = TextEditingController();


  @override
  Widget build(BuildContext context) {

    final btnForgotPassword = ElevatedButton(
      child: const Text("Login"),
      onPressed: () {
        //TODO: Login
        print(emailController.text);

      },
    );


    //return const Text("noi dung");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child:  const Text("Forgot password", style: AppTheme.textStyle_1,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: emailController, decoration: AppTheme.defaultInputDecoration("Send new password to email"),),
            ),
            btnForgotPassword,

          ],
        ),
      ),
    );

  }

}