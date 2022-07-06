
import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

import '../../commons/base_statefull_widget.dart';
import '../../commons/coordinator/constants.dart';
import 'show_layout_provider.dart';


class ShowLayoutPage extends BaseStateFulWidget {

  final String title = "Show Demo Layour";

  ShowLayoutPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);
  // const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ShowLayoutPageState();
  }

}


class _ShowLayoutPageState extends BaseState<ShowLayoutPage, ShowLayoutProvider> {


  @override
  getAppBar(BuildContext context) => widget.title;

  @override
  Widget getBody(BuildContext context) {

    var container = Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(25) ,
      // color: Colors.black12,
      // decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0))),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.black12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        getText("str 1"),
        getText("If this value is used in a vertical direction, a s used in a vertical direction, a [VerticalDirection] must be"),
        getText("If this value is used in a vertical direction, a is used in a vertical direction, a "
            "[VerticalDirection] must be, If this value is used in a vertical direction, a [VerticalDirection] must be"),
        getText("str 1"),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Text("Element 1"),
            Text("Element 2"),
            Text("Element 3"),
          ],
        ),
      ],),
    );

    // var center = Center(
    //   width: 100,
    //   height: 30,
    //   color: Colors.black12,
    //   child: getText("contaci"),
    // );

    return container;
  }
  
  
  Widget getText(String str) {
    return Text(str,
      style: const TextStyle(backgroundColor: Colors.yellow),);
  }


}