/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_view_controllable.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'user_list_interactor.dart';

class UserListPage extends BaseStateFulWidget with DbNoteViewControllable {

  final String title = "UserList Page";

  UserListPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserListPageState();
  }

}

class _UserListPageState extends State<UserListPage> {

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return const Text("data");
  }

}