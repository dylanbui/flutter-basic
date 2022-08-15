/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_view_controllable.dart';
import 'package:simple_auth_1/typi_code/users/user_list/user_list_router.dart';

import 'interactor/user_list_bloc.dart';
import 'interactor/user_list_page.dart';

// Listener

// Buildable

abstract class UserListBuildable extends DbNoteBuildable {

  Widget build();

  NoteViewControllable buildController();

}

// Builder

class UserListBuilder extends DbNoteBuilder implements UserListBuildable {
  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  NoteViewControllable buildController() {
    final router = UserListRouter();
    final page = UserListPage();
    viewControllable = BlocProvider(create: (_) =>  UserListInteractor(router: router), child: page,) as NoteViewControllable;
    return viewControllable;
  }
}
 
 

