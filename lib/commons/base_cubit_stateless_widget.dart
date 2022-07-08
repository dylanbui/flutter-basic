
import 'package:dialog_loader/dialog_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_auth_1/app_theme.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/custom_app_bar.dart';

//ignore: must_be_immutable
abstract class BaseCubitStateLessWidget<P extends Cubit> extends StatelessWidget {

  late P pageProvider;
  late State currentState;
  DbNoteRouter? router;

  BaseCubitStateLessWidget({Key? key, this.router}) : super(key: key);

  bool showAppBar = true;
  DialogLoader? dialogLoader;

  // Init chi chay 1 lan khi build lan dau
  bool _begin = true;
  void init(BuildContext context);

  // Tao make layout
  /// Way 1: should be overridden in extended widget
  Widget? getLayout(BuildContext context) => null;

  /// Way 2
  dynamic getAppBar(BuildContext context) => "";
  Widget getBody(BuildContext context) => const Text("implement getBody() function");
  List<Widget> getAppBarAction() => [];


  @override
  Widget build(BuildContext context) {
    pageProvider = BlocProvider.of<P>(context);
    currentState = pageProvider.state;

    if (_begin) {
      init(context);
      _begin = false;
    }

    // Muon control thang nao thi phai dung context thang do
    var layout = getLayout(context);
    if (layout != null) {
      return layout;
    }

    var appBar = getAppBar(context);
    if (appBar is String) {
      // tao 1 custom use for common theme
      appBar = CustomAppBar(appBar, appBarActions: getAppBarAction(),);
    }

    // if (appBar is! AppBar) {
    //   throw Exception("Need to AppBar Widget or String !");
    // }

    if (showAppBar == false) {
      appBar = null;
    }

    return Scaffold(
      appBar: appBar,
      body: getBody(context),
    );
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
  void showErrorSnackbar(String message, BuildContext context) {
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