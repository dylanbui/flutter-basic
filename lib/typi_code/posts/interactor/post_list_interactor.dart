/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


// Provider

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_auth_1/api/post_api.dart';
import 'package:simple_auth_1/commons/architecture_ribs/cubit_interactor.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_interactor.dart';
import 'package:simple_auth_1/constants.dart';
import 'package:simple_auth_1/models/post.dart';
import 'package:simple_auth_1/typi_code/posts/interactor/post_list_event_state.dart';
import 'package:simple_auth_1/typi_code/posts/post_builder.dart';
import 'package:simple_auth_1/typi_code/posts/post_router.dart';
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


class PostListInteractor extends CubitInteractor<PostRoutable, PostListState> {


  PostListInteractor(router) : super(PostListInitial());

  Future onRefresh() async {
    await loadData(firstLoad: false);
  }

  Future loadData({bool firstLoad = true}) async {
    if (firstLoad) {
      emit(PostListInProgress());
    }

    // Dau tien load tuong duong 3 page voi offset = 15
    List<Post>? list = await PostApi().getPostList(page: 0, offset: 15);

    if (list != null) {
      emit(PostListGetDataSuccess(list, true, list.length, 0));
    } else {
      emit(PostListGetDataError(const BaseError(404,"Loi ko load dc du lieu")));
    }
  }

  Future loadMoreData() async {
    var currentState = state;
    if (currentState is PostListGetDataSuccess) {

      // Khi load more phai tinh lai so page
      var currentPage = currentState.currentPage;
      if (currentPage == 0) {
        currentPage = 2;
      }

      int nextPage = currentState.currentPage + 1;

      List<Post>? list = await PostApi().getPostList(page: nextPage, offset: 5);

      if (list != null) {
        List<Post> posts = currentState.items + list;
        emit(PostListGetDataSuccess(posts, true, posts.length, nextPage));
      } else {
        emit(PostListGetDataError(const BaseError(404,"Loi ko load dc du lieu")));
      }
    }

  }








}