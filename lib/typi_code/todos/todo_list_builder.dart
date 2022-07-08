/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:56
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth_1/api/todo_api.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_cubit.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_page.dart';

// Listener

// Route

class TodoListRoute extends DbNoteRoute {
  TodoListRoute();
}

// Buildable

abstract class TodoListBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class TodoListBuilder extends DbNoteBuilder with DbNoteRouter implements TodoListBuildable {

  @override
  Widget build() {
    final postDetailPage = TodoListPage(router: this,);
    rootPage = BlocProvider(create: (_) =>  TodoListCubit(ToDoApiImpl()), child: postDetailPage,);
    return rootPage;
  }

  // TodoListBuildable
  @override
  void navigate(DbNoteRoute toRoute, BuildContext nextContext, {Map<String, Object>? parameters}) {

  }

}
 
 

