/*
 * Created with IntelliJ IDEA
 * Package: commons
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 29/06/2022 - 14:16
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';

// Cach 1
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {

  final String title;
  final List<Widget>? appBarActions;
  bool hideBackButton;

  @override
  final Size preferredSize; // default is 56.0

  CustomAppBar(this.title, {this.appBarActions, this.hideBackButton = false,  Key? key,}) : preferredSize = const Size.fromHeight(kToolbarHeight),
        super
      (key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Align(
          child: Text(title, style: const TextStyle(color: Colors.white)),
          alignment: Alignment.centerLeft
      ),
      titleSpacing: hideBackButton ? kTabLabelPadding.right : 0,
      automaticallyImplyLeading: !hideBackButton,
      // backgroundColor: Colors.white,
      actions: appBarActions,
    );
  }
}


// Cach 2
class MyAppBar extends AppBar {

  final String titleBar;
  List<Widget> appBarActions = [];

  // <Widget>[
  // IconButton(
  // icon: const Icon(Icons.notifications),
  // onPressed: () => null,
  // ),
  // IconButton(
  // icon: const Icon(Icons.person),
  // onPressed: () => null,
  // ),
  // ]

  MyAppBar(this.titleBar, {appBarActions, Key? key}) : super(key: key,
    iconTheme: const IconThemeData(
      color: Colors.black, //change your color here
    ),
    backgroundColor: Colors.white,
    title: Text(titleBar, style: const TextStyle(color: Colors.black),),
    elevation: 0.0,
    titleSpacing: 0,
    automaticallyImplyLeading: true,
    actions: appBarActions,
  );

}