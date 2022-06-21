
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/login_scene/forgot_password/forgot_password_provider.dart';
import 'package:simple_auth_1/login_scene/login_coordinator.dart';

import '../../app_theme.dart';

class ForgotPasswordPage extends BaseStateFulWidget {

  final String title = "ForgotPassword Page";

  int codeFw;
  String? messageFw;

  ForgotPasswordPage(this.codeFw, {this.messageFw, Key? key, DbNavigation? nav}) : super(key: key, nav: nav);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ForgotPasswordPageState();
  }

}

class _ForgotPasswordPageState extends BaseState<ForgotPasswordPage, ForgotPasswordProvider> {

  TextEditingController emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getLayout(BuildContext context) {

    log("codeFw = ${widget.codeFw}");
    log("messageFw = ${widget.messageFw}");

    final btnForgotPassword = ElevatedButton(
      child: const Text("Yeu cau lay lai PW"),
      onPressed: () {
        //TODO: Login
        print(emailController.text);

      },
    );

    final btnAuthCode = TextButton(onPressed: () async {

      widget.nav?.navigate(AuthPasswordRouter("666888"), context);

    }, child: const Text("Auth Code", style: AppTheme.textStyle_3,));


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
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Does not have Account ???"),
                btnAuthCode
              ],
            ),
          ],
        ),
      ),
    );

  }

}