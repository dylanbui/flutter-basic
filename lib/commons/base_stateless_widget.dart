
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/base_proviver.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

//ignore: must_be_immutable
abstract class BaseStateLessWidget<P extends BaseProvider> extends StatelessWidget {

  late P pageProvider;
  DbNavigation? nav;

  BaseStateLessWidget({Key? key, this.nav}) : super(key: key);

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    pageProvider = Provider.of<P>(context);
    return getLayout(context);
  }
}