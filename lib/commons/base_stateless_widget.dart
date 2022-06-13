
import 'package:flutter/material.dart';

abstract class BaseStateLessWidget extends StatelessWidget {

  const BaseStateLessWidget({Key? key}) : super(key: key);

  Widget getLayout(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return getLayout(context);
  }
}