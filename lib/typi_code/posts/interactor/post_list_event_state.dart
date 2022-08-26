/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 29/07/2022 - 17:56
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/post.dart';

// -------------- EVENT ---------------------

// abstract class PostListEvent extends BaseBlocEvent { }
//
// class PostListGetDataEvent extends PostListEvent {
//   // final List<ListingScorecardTypes> scorecardTypes;
//   // final Pair<DateTime, DateTime> rangeData;
//   // final String keySearch;
//   //
//   // ListingTabGetData({this.scorecardTypes, this.rangeData, this.keySearch});
// }
//
// class PostListGetMoreDataEvent extends PostListEvent {}
//
// class PostListStartSearchingEvent extends PostListEvent {}
//
// class PostListCancelSearchingEvent extends PostListEvent {}


// -------------- STATE ---------------------

abstract class PostListState extends BaseBlocState { }

class PostListInitial extends PostListState { }

class PostListInProgress extends PostListState {

}

class PostListInLoadMoreProgress extends PostListState {

}

class PostListGetDataSuccess extends PostListState {
  final List<Post> items;
  final bool hasReachedMax;
  final int totalItems;
  final int currentPage;

  PostListGetDataSuccess(this.items, this.hasReachedMax, this.totalItems, this.currentPage);

  @override
  List<Object> get props => [items, hasReachedMax, totalItems];
}

class PostListGetDataError<T extends BaseError> extends PostListState {
  final T error;

  PostListGetDataError(this.error);

  @override
  List<Object> get props => [error];
}

class TodoListSearchingBegin extends PostListState {}

class TodoListSearchingEnd extends PostListState {}

