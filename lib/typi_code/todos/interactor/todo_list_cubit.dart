/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:56
 * To change this template use File | Settings | File Templates.
 */

// Provider

import 'package:simple_auth_1/api/todo_api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/todo.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_state.dart';

class TodoListCubit extends Cubit<TodoListState> {

  final TodoApi _todoApi;

  TodoListCubit(this._todoApi) : super(TodoListInitial());

  void initial() {

  }

  void onScrollListener(int index) {

  }


  Future onRefresh() async {

  }

  Future loadData() async {

    emit(TodoListInProgress());

    List<Todo>? list = await _todoApi.getTodoList();

    if (list != null) {
      emit(TodoListGetDataSuccess(list, true, list.length));
    } else {
      emit(TodoListGetDataError(const BaseError(404,"Loi ko load dc du lieu")));
    }

  }

  void loadMoreData() {

  }





}