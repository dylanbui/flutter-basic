/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


// Provider

import 'package:simple_auth_1/commons/architecture_ribs/cubit_interactor.dart';
import 'package:simple_auth_1/typi_code/users/user_list/interactor/user_list_event_state.dart';
import 'package:simple_auth_1/typi_code/users/user_list/user_list_router.dart';


// Cach 2 :
/*
abstract class BlocInteractor<T extends DbNoteRouter, Event, State> extends Bloc<Event, State> {

  T? router;

  BlocInteractor(super.initialState);
}

class UserInterListBloc extends BlocInteractor<UserListRouter, UserListEvent, UserListState> {
  UserInterListBloc({r}) : super(InitListGetDataState()) {
    router = r;
  }
}
*/


class UserListInteractor extends CubitInteractor<UserListRouter, UserListState> {

  UserListInteractor(UserListRouter router) : super(InitListGetDataState()) {
    // Them presenter neu can thiet
    this.router = router;
  }


}