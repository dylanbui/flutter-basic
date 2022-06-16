import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:simple_auth_1/widget/platform_widget.dart';


class PlatformProgress extends PlatformWidget<CupertinoActivityIndicator, CircularProgressIndicator> {
  const PlatformProgress({Key? key}) : super(key: key);

  @override
  CircularProgressIndicator buildAndroidWidget(BuildContext context) {
    return const CircularProgressIndicator();
  }

  @override
  CupertinoActivityIndicator buildIosWidget(BuildContext context) {
    return const CupertinoActivityIndicator();
  }

  @override
  Widget buildDefaultWidget(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
