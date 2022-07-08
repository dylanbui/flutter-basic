
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_provider.dart';
import 'package:simple_auth_1/commons/coordinator/constants.dart';

//ignore: must_be_immutable
abstract class BaseStateLessWidget<P extends BaseProvider> extends StatelessWidget {

  late P pageProvider;
  DbNavigation? nav;
  DbNoteRouter? router;

  BaseStateLessWidget({Key? key, this.nav, this.router}) : super(key: key);

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    pageProvider = Provider.of<P>(context);
    return getLayout(context);
  }
}