/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 29/07/2022 - 17:56
 * To change this template use File | Settings | File Templates.
 */

import 'package:simple_auth_1/constants.dart';

// -------------- EVENT ---------------------

abstract class UserListEvent extends BaseBlocEvent { }

class UserListGetDataEvent extends UserListEvent {
  // final List<ListingScorecardTypes> scorecardTypes;
  // final Pair<DateTime, DateTime> rangeData;
  // final String keySearch;
  //
  // ListingTabGetData({this.scorecardTypes, this.rangeData, this.keySearch});
}

class UserListGetMoreDataEvent extends UserListEvent {}

class UserListStartSearchingEvent extends UserListEvent {}

class UserListCancelSearchingEvent extends UserListEvent {}


// -------------- STATE ---------------------

abstract class UserListState extends BaseBlocState { }

class InitListGetDataState extends UserListState { }

class UserListGetDataState extends UserListState { }

class UserListGetMoreDataState extends UserListEvent {}