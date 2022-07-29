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
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'user_list_bloc.dart';

class UserListPage extends BaseStateFulWidget {

  final String title = "UserList Page";

  UserListPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {
    return _UserListPageState();
  }

}

class _UserListPageState extends BaseState<UserListPage, UserListProvider> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget getLayout(BuildContext context) {
    return const Text("data");

  }

}