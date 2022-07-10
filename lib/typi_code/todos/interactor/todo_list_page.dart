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
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_cubit_stateless_widget.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/models/todo.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_cubit.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_state.dart';
import 'package:simple_auth_1/utils/logger.dart';
import 'package:simple_auth_1/widget/platform_progress.dart';

class TodoListPage extends BaseCubitStateLessWidget<TodoListCubit, TodoListState> {

  // @override
  // String title = "TodoList Page";

  @override
  String getTitle() {
    return "";
  }

  TodoListPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  void init(BuildContext context) {
    pageProvider.loadData();

  }

  @override
  List<Widget> getAppBarAction() {
    return <Widget>[
      IconButton(
        icon: const Icon(Icons.notifications),
        onPressed: () {
          eLog("click : Icons.notifications");
        },
      ),
      IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {
          eLog("click : Icons.person");
        },
      ),
    ];
  }

  @override
  void blocConsumerListener(BuildContext context, TodoListState state) {
    // Show toast event at here
    if (state is TodoListGetDataError) {
      // showToast(state.error.messenger);
      // showErrorSnackbar(state.error.messenger, context);
      eLog("blocConsumerListener");
    }
  }

  @override
  bool blocConsumerBuildWhen(BuildContext context, TodoListState state) {
    eLog("blocConsumerBuildWhen");
    if (state is TodoListGetDataError) {
      // showToast(state.error.messenger);
      showErrorSnackbar(state.error.messenger, context);
      return false;
    }
    return true;
  }

  @override
  Widget getBody(BuildContext context, TodoListState state) {
    if (state is TodoListInProgress) {
      return const Center(child: PlatformProgress());
    } else if (state is TodoListGetDataError) {
      //var state = state as TodoListGetDataError;
      // show loi
      showErrorSnackbar(state.error.messenger, context);
      // showToast(state.error.messenger);
    }

    return _buildTodosList(context);
  }

  // @override
  // State<StatefulWidget> createState() {
  //   return _TodoListPageState();
  // }

  Widget _buildTodosList(BuildContext context) {

    List<Todo> items = [];
    if (currentState is TodoListGetDataSuccess) {
      var state = currentState as TodoListGetDataSuccess;
      items = state.items;
      // return Column(
      //   children: <Widget>[
      //     Expanded(
      //       child: RefreshIndicator(
      //         onRefresh: pageProvider.onRefresh,
      //         child: ListView.builder(
      //           physics: const BouncingScrollPhysics(),
      //           itemCount: state.totalItems,
      //           itemBuilder: (BuildContext context, int index) {
      //             pageProvider.onScrollListener(index);
      //             return _buildTodoItem(context, state.items[index], index);
      //           },
      //         ),
      //       ),
      //     ),
      //     // if (pageProvider.isLoadMore) const PlatformProgress()
      //   ],
      // );
    }

    return Column(
      children: <Widget>[
        Expanded(
          child: RefreshIndicator(
            onRefresh: pageProvider.onRefresh,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                pageProvider.onScrollListener(index);
                return _buildTodoItem(context, items[index], index);
              },
            ),
          ),
        ),
        // if (pageProvider.isLoadMore) const PlatformProgress()
      ],
    );

  }

  Widget _buildTodoItem(BuildContext context, Todo todo, int index) {
    return ListTile(
      title: Text(
        "${index.toString()}: " + todo.title.toString(),
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(todo.title ?? ""),
      onTap: () {
        eLog("GestureDetector index : ${index.toString()}");
        eLog("Post id : ${todo.id.toString()}");
        // router?.navigate(PostDetailRoute(post.id ?? 4), context);
      },
    );


  }


}

// class _TodoListPageState extends BaseState<TodoListPage, TodoListProvider> {
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget getLayout(BuildContext context) {
//     return const Text("");
//
//   }
//
// }