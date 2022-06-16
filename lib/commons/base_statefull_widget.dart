
import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_auth_1/AppTheme.dart';


// https://github.com/FlorinMihalache/flutter_progress_hud

abstract class BaseStateFulWidget extends StatefulWidget {
  const BaseStateFulWidget({Key? key}) : super(key: key);
}

abstract class BaseState<B extends BaseStateFulWidget> extends State<B> {

  /// should be overridden in extended widget
  Widget? getLayout(BuildContext context) => null;

  void startBuild(BuildContext context);
  String getTitle(BuildContext context) => "";
  Widget getBody(BuildContext context) => const Text("implement getBody() function");

  dynamic getAppBar(BuildContext context) => "";

  late BuildContext buildContext;
  DialogLoader? dialogLoader;

  // @override
  // Widget build(BuildContext context) {
  //   buildContext = context;
  //   return getLayout();
  // }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    dialogLoader = DialogLoader(context: buildContext);

    startBuild(context);

    // Muon control thang nao thi phai dung context thang do
    var layout = getLayout(context);
    if (layout == null) {
      var appBar = getAppBar(context);
      if (appBar is String) {
        appBar = AppBar(title: Text(appBar),);
      }

      if (appBar is! AppBar) {
        throw Exception("Need to AppBar Widget or String !");
      }

      return Scaffold(
        appBar: appBar,
        body: getBody(context),
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

  void showProgressLoading({String? text = "Đang xử lý ..."}) {
    // LoadingIndicatorDialog().show(context, text: text ?? "Đang xử lý");
    dialogLoader?.show(
      theme: LoaderTheme.dialogDefault,
      title: Container(
        padding: const EdgeInsets.all(10),
        child: Text(text ?? "Đang xử lý ...", style: AppTheme.textStyle_2,),
      ),
      leftIcon: const SizedBox(
        child: CircularProgressIndicator(),
        height: 30.0,
        width: 30.0,
      ),
    );

    // Xai khong tot
    // final progress = ProgressHUD.of(_contextLoading);
    // if (text == null) {
    //   progress?.show();
    // } else {
    //   progress?.showWithText(text);
    // }
  }

  void hideProgressLoading() {
    // LoadingIndicatorDialog().dismiss();
    dialogLoader?.close();

    // Xai khong tot
    // final progress = ProgressHUD.of(_contextLoading);
    // progress?.dismiss();
  }

  //endregion

}