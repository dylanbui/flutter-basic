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
import 'package:simple_auth_1/commons/architecture_ribs/cubit_interactor.dart';
import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/todo.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_state.dart';
import 'package:simple_auth_1/typi_code/todos/todo_list_builder.dart';


class TodoListInteractor extends CubitInteractor<TodoListRoutable, TodoListState> {


  final TodoApi _todoApi;

  TodoListInteractor(this._todoApi, {router}) : super(TodoListInitial());

  void initial() {


  }

  void onScrollListener(int index) {

  }


  Future onRefresh() async {
    await loadData(firstLoad: false);
  }

  Future loadData({bool firstLoad = true}) async {

    if (firstLoad) {
      emit(TodoListInProgress());
    }

    // Dau tien load tuong duong 3 page voi offset = 15
    List<Todo>? list = await _todoApi.getTodoList(page: 0, offset: 15);

    if (list != null) {
      emit(TodoListGetDataSuccess(list, true, list.length, 0));
    } else {
      emit(TodoListGetDataError(const BaseError(404,"Loi ko load dc du lieu")));
    }

  }

  Future loadMoreData() async {
    var currentState = state;
    if (currentState is TodoListGetDataSuccess) {

      var currentPage = currentState.currentPage;
      if (currentPage == 0) {
        currentPage = 2;
      }

      int nextPage = currentState.currentPage + 1;

      List<Todo>? list = await _todoApi.getTodoList(page: nextPage, offset: 5);

      if (list != null) {
        List<Todo> todos = currentState.items + list;
        emit(TodoListGetDataSuccess(todos, true, todos.length, nextPage));
      } else {
        emit(TodoListGetDataError(const BaseError(404,"Loi ko load dc du lieu")));
      }
    }

  }









}