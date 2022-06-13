
import 'package:flutter/material.dart';

import 'AppTheme.dart';

class ForgotPasswordPage extends StatefulWidget {

  final String title = "ForgotPassword Page";

  const ForgotPasswordPage({Key? key}) : super(key: key);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }

}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

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