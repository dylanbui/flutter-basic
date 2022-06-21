
import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/app_theme.dart';
import 'package:simple_auth_1/commons/base_proviver.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

// https://github.com/FlorinMihalache/flutter_progress_hud

//ignore: must_be_immutable
abstract class BaseStateFulWidget extends StatefulWidget {

  DbNavigation? nav;

  BaseStateFulWidget({Key? key, this.nav}) : super(key: key);

}

abstract class BaseState<B extends BaseStateFulWidget, P extends BaseProvider> extends State<B> {

  /// should be overridden in extended widget
  Widget? getLayout(BuildContext context) => null;

  // void startBuild(BuildContext context) { }
  String getTitle(BuildContext context) => "";
  Widget getBody(BuildContext context) => const Text("implement getBody() function");

  dynamic getAppBar(BuildContext context) => "";

  late BuildContext buildContext;
  DialogLoader? dialogLoader;

  late P pageProvider;

  // P createProvider(BuildContext context);

  // @override
  // Widget build(BuildContext context) {
  //   buildContext = context;
  //   return getLayout();
  // }

  @override
  Widget build(BuildContext context) {
    buildContext = context;
    pageProvider = Provider.of<P>(context);
    dialogLoader = DialogLoader(context: buildContext);

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

  // TODO: Cai nay co the chay sai, chua dc kiem chung
  void showErrorSnackbar(String message) {
    var snackBar = SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black87),
      ),
      backgroundColor: Colors.yellowAccent,
      duration: const Duration(seconds: 1),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    // Scaffold.of(context).showSnackBar(snackBar); // Da bi deprecated
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