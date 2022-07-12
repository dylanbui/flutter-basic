/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:59
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/todo.dart';

/// State: Initial, InProgress, Success, Failure, Begin, End
///
///


abstract class TodoListState extends BaseBlocEvent {
  // const TodoListState();
  //
  // @override
  // List<Object> get props => [];
}

class TodoListInitial extends TodoListState {
}


class TodoListInProgress extends TodoListState {

}

class TodoListInLoadMoreProgress extends TodoListState {

}

class TodoListGetDataSuccess extends TodoListState {
  final List<Todo> items;
  final bool hasReachedMax;
  final int totalItems;
  final int currentPage;

  TodoListGetDataSuccess(this.items, this.hasReachedMax, this.totalItems, this.currentPage);

  @override
  List<Object> get props => [items, hasReachedMax, totalItems];
}

class TodoListGetDataError<T extends BaseError> extends TodoListState {
  final T error;

  TodoListGetDataError(this.error);

  @override
  List<Object> get props => [error];
}

class TodoListSearchingBegin extends TodoListState {}

class TodoListSearchingEnd extends TodoListState {}
