
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/typi_code/posts/interactor/post_list_page.dart';

import 'app_theme.dart';
import 'login_scene/login/login_page.dart';
import 'login_scene/login/login_provider.dart';

class SplashPage extends StatefulWidget {

  final String title = "Demo plash Page";

  const SplashPage({Key? key}) : super(key: key);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }

}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {

    // final router = MaterialPageRoute(builder: (context) =>
    //     ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: const LoginPage(),)
    // );

    final btnLogin = ElevatedButton(onPressed: () {

      Navigator.push(context, PageTransition(
          child: ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: LoginPage(),),
          type: PageTransitionType.rightToLeft),);

      // Navigator.push(context, PageTransition(
      //     duration: const Duration(milliseconds: 250),
      //     reverseDuration: const Duration(milliseconds: 250),
      //     child: ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: const LoginPage(),),
      //     type: PageTransitionType.rightToLeft),);

      // Replace current widget
      // Navigator.pushReplacement(context, PageTransition(
      //     duration: const Duration(milliseconds: 250),
      //     reverseDuration: const Duration(milliseconds: 250),
      //     child: ChangeNotifierProvider<LoginProvider>.value(value: LoginProvider(), child: const LoginPage(),),
      //     type: PageTransitionType.rightToLeft),);

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) =>
      //     ChangeNotifierProvider<LoginProvider>.value(
      //       value: LoginProvider(),
      //       child: const LoginPage(),
      //     ),
      //   ),
      // );





    }, child: const Text("Login"));


    final btnSignUp = ElevatedButton(onPressed: () {

      // Navigator.push(context, PageTransition(
      //     child: ChangeNotifierProvider<PostListProvider>.value(value: PostListProvider(), child: PostListPage(),),
      //     type: PageTransitionType.rightToLeft),);

      }, child: const Text("Sign Up"));

    // final btnSignUp = TextButton(onPressed: () async {
    //
    //   //TODO: signup screen
    //   //Navigator.push(context, route)
    //   final dataFromSecondPage = await Navigator.push(context, MaterialPageRoute(builder: (context) =>
    //       SignupPage(user, onChangeText: (String text) {
    //         print(" Hang gui kem ---- " + text);
    //         }, callback: this,)),) as User;
    //
    //
    //   print(dataFromSecondPage.userName);
    //   print(dataFromSecondPage.email);
    //
    //
    //
    // }, child: const Text("Sign Up", style: AppTheme.textStyle_2,));


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
              child:  const Text("Demo Splash", style: AppTheme.textStyle_1,),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: btnLogin,
            ),
            Container(
              height: 10,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: null,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: btnSignUp,
            ),
          ],
        ),
      ),
    );

  }



}