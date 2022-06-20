
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/login_scene/login_coordinator.dart';

import '../../AppTheme.dart';
import 'auth_password_provider.dart';

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

class _ForgotPasswordPageState extends BaseState<AuthPasswordPage, AuthPasswordProvider> {

  TextEditingController authController = TextEditingController();


  @override
  void initState() {
    // Chua mound => context == null
    // Chi chay 1 lan
    // TODO: implement initState
    super.initState();

    authController.text = widget.strCodeAuth;
  }

  @override
  Widget? getLayout(BuildContext context) {

    final btnAuthCode = ElevatedButton(
      child: const Text("Auth Code"),
      onPressed: () {
        //TODO: btnAuthCode
        log(authController.text);

        showProgressLoading();
        pageProvider.doAuthPassword("123", "123").then((value) {
          hideProgressLoading();
          if (value == true) {
            widget.nav?.navigate(AuthPasswordCompletedRouter(10), context);
          }
        });

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
              child: const Text("Auth code get new password", style: AppTheme.textStyle_1,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: authController, decoration: AppTheme.defaultInputDecoration("Send new password to email"),),
            ),
            btnAuthCode,

          ],
        ),
      ),
    );

  }




}