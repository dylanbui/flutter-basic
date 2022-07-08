/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 08/07/2022 - 11:59
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/constants.dart';

abstract class TodoListEvent extends BaseBlocEvent {
  // const TodoListEvent();
  // List<Object> get props => ["tring",  "assdd"];
  // List<Object> get props => ["tring",  "assdd"];
}


class TodoListGetData extends TodoListEvent {
  // final List<ListingScorecardTypes> scorecardTypes;
  // final Pair<DateTime, DateTime> rangeData;
  // final String keySearch;
  //
  // ListingTabGetData({this.scorecardTypes, this.rangeData, this.keySearch});
}

class TodoListGetMoreData extends TodoListEvent {}

class TodoListStartSearching extends TodoListEvent {}

class TodoListCancelSearching extends TodoListEvent {}
