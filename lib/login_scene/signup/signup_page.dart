
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';
import 'package:simple_auth_1/login_scene/signup/signup_builder.dart';
import 'package:simple_auth_1/login_scene/signup/signup_provider.dart';

import '../../app_theme.dart';
import '../../constants.dart';



//ignore: must_be_immutable
class SignupPage extends BaseStateFulWidget {

  final String title = "Login Page";
  final User? user;
  // final Function(String dateTime) onChangeDate;
  final Function(String text) onChangeText;

  ISignupPage callback;

  SignupPage({Key? key, DbNoteRouter? router, this.user, required this.onChangeText, required this.callback}) : super(key: key, router: router);

  //const SignupPage({Key? key}) : super(key: key);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _SignupPageState();
  }

}

class _SignupPageState extends BaseState<SignupPage, SignupProvider> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = widget.user?.userName ?? "";
    emailController.text = widget.user?.email ?? "";
    passwordController.text = widget.user?.password ?? "";
    yearController.text = widget.user?.value?.toString() ?? "123";
  }

  @override
  Widget getLayout(BuildContext context) {
    // final todo = ModalRoute.of(context)?.settings.arguments as User;

    final btnSignup = ElevatedButton(
      child: const Text("Sign Up"),
      onPressed: () {
        //TODO: Login
        // print(nameController.text);
        // print(passwordController.text);
        String name = nameController.text.isNotEmpty ? nameController.text : "";
        String email = emailController.text.isNotEmpty ? emailController.text : "";
        String password = passwordController.text.isNotEmpty ? passwordController.text : "";
        String rePassword = rePasswordController.text.isNotEmpty ? rePasswordController.text : "";
        int year = yearController.text.isNotEmpty ? int.parse(yearController.text) : 1122;

        final user = User(name, email, password, year);
        // Goi call back ve
        widget.onChangeText("Gui them thang nay --- " + TimeOfDay.now().toString());

        widget.callback.returnWithAbstractClass("Gui them hang tu callback --- " + TimeOfDay.now().toString());

        widget.nav?.pop(context);
        // Navigator.pop(context, user); // data back to the first screen}
        // Navigator.pop(context);

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
              child:  const Text("Sign Up", style: AppTheme.textStyle_1,),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text("Register new User", style: AppTheme.textStyle_2,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: nameController, decoration: AppTheme.defaultInputDecoration("User Name"),),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: emailController, decoration: AppTheme.defaultInputDecoration("Email"),),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: passwordController, decoration: AppTheme.defaultInputDecoration("Password"), obscureText: true,),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(controller: rePasswordController, decoration: AppTheme.defaultInputDecoration("Re Password"), obscureText: true,),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(controller: yearController,
                decoration: AppTheme.defaultInputDecoration("Nam sinh"),
                keyboardType: TextInputType.number,),
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: btnSignup,
            ),

            //TODO: Add check box here

          ],
        ),
      ),
    );

  }

}