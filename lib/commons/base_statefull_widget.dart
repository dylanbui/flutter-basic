
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:fluttertoast/fluttertoast.dart';

// https://github.com/FlorinMihalache/flutter_progress_hud

abstract class BaseStateFulWidget extends StatefulWidget {
  const BaseStateFulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<B extends BaseStateFulWidget> extends State<B> {



  /// should be overridden in extended widget
  Widget? getLayout() => null;

  String getTitle() => "";
  Widget getBody() => const Text("implement getBody() function");

  late BuildContext buildContext;
  // late ProgressHUD progress;

  // @override
  // Widget build(BuildContext context) {
  //   buildContext = context;
  //   return getLayout();
  // }

  @override
  Widget build(BuildContext context) {
    buildContext = context;

    var layout = getLayout();
    if (layout == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(getTitle()),
        ),
        body: ProgressHUD(
            child: getBody()
        ),
      );
    } else {
      return layout;
    }
  }



  //region Private Support Methods
  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

  void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }

  void showErrorSnackbar(String message) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.red),
      ),
      backgroundColor: Colors.white,
      duration: const Duration(seconds: 1),
    ));
  }
//endregion

}