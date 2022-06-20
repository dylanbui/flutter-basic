
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

abstract class BaseStateLessWidget extends StatelessWidget {

  DbNavigation? nav;

  BaseStateLessWidget({Key? key, this.nav}) : super(key: key);

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }
}