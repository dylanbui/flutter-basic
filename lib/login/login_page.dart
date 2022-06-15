
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/signup_page.dart';
import 'package:simple_auth_1/login/login_provider.dart';

import '../AppTheme.dart';
import '../constants.dart';
import '../commons/base_statefull_widget.dart';

class LoginPage extends BaseStateFulWidget {

  final String title = "Login Page";

  const LoginPage({Key? key}) : super(key: key);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }

}


class _LoginPageState extends BaseState<LoginPage> implements ISignupPage {

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  @override
  void returnWithAbstractClass(String returnText) {
    print("returnWithAbstractClass =====>" + returnText);
  }

  @override
  String getTitle(BuildContext context) => widget.title;

  @override
  Widget getBody(BuildContext context) {

    const user = User("Duc", "email duc", "password duc", 1);
    final presenter = Provider.of<LoginProvider>(context, listen: false);

    final btnLogin = ElevatedButton(
      child: const Text("Login"),
      onPressed: () {
        //TODO: Login
        print(nameController.text);
        print(passwordController.text);

        // Validate
        // Show loading

        showProgressLoading();
        presenter.doLogin(nameController.text, passwordController.text).then((value) {
          hideProgressLoading();

          final user = value.item1;
          final error = value.item2 ?? const BaseError("Khong bit la cai gi");

          if (user != null) {
            log("Login thanh cong - Username = ${user.userName} -- Email = ${user.email}");
            return;
          }

          log("Co loi xay ra roi !! " + error.error.toString());

        });

      },
    );

    final btnForgotPw = TextButton(onPressed: () {

      //TODO: Forgot password screen

    }, child: const Text("Forgot password"));


    final btnSignUp = TextButton(onPressed: () async {

      //TODO: signup screen
      //Navigator.push(context, route)
      final dataFromSecondPage = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
          SignupPage(user, onChangeText: (String text) {
            print(" Hang gui kem ---- " + text);
          }, callback: this,)),) as User;


      print(dataFromSecondPage.userName);
      print(dataFromSecondPage.email);



    }, child: const Text("Sign Up", style: AppTheme.textStyle_2,));

    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child:  const Text("TutorialKart", style: AppTheme.textStyle_1,),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text("Sign In", style: AppTheme.textStyle_2,),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(controller: nameController, decoration: AppTheme.defaultInputDecoration("User Name"),),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(controller: passwordController, decoration: AppTheme.defaultInputDecoration("Password"), obscureText: true,),
          ),
          btnForgotPw,
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: btnLogin,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text("Does not have Account ???"),
              btnSignUp
            ],
          ),
        ],
      ),
    );
  }


/*

  @override
  Widget build(BuildContext context) {
    const user = User("Duc", "email duc", "password duc", 1);
    final presenter = Provider.of<LoginProvider>(context, listen: false);

    final btnLogin = ElevatedButton(
      child: const Text("Login"),
      onPressed: () {
        //TODO: Login
        print(nameController.text);
        print(passwordController.text);

        // Validate
        // Show loading


        showProgressLoading();
        presenter.doLogin(nameController.text, passwordController.text).then((value) {
          hideProgressLoading();

          final user = value.item1;
          final error = value.item2 ?? const BaseError("Khong bit la cai gi");

          if (user != null) {
            log("Login thanh cong - Username = " + user.userName.toString() + " -- Email = " + user.email.toString());
            return;
          }

          log("Co loi xay ra roi !! " + error.error.toString());

        });

      },
    );

    final btnForgotPw = TextButton(onPressed: () {

      //TODO: Forgot password screen

    }, child: const Text("Forgot password"));


    final btnSignUp = TextButton(onPressed: () async {

      //TODO: signup screen
      //Navigator.push(context, route)
      final dataFromSecondPage = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
          SignupPage(user, onChangeText: (String text) {
            print(" Hang gui kem ---- " + text);
            }, callback: this,)),) as User;


      print(dataFromSecondPage.userName);
      print(dataFromSecondPage.email);



    }, child: const Text("Sign Up", style: AppTheme.textStyle_2,));


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
              child:  const Text("TutorialKart", style: AppTheme.textStyle_1,),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text("Sign In", style: AppTheme.textStyle_2,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: nameController, decoration: AppTheme.defaultInputDecoration("User Name"),),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(controller: passwordController, decoration: AppTheme.defaultInputDecoration("Password"), obscureText: true,),
            ),
            btnForgotPw,
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: btnLogin,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Does not have Account ???"),
                btnSignUp
              ],
            ),
          ],
        ),
      ),
    );

  }

*/

}