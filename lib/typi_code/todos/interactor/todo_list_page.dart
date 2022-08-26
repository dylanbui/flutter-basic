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
import 'package:loadmore/loadmore.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/custom_app_bar.dart';
import 'package:simple_auth_1/models/todo.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_cubit.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_interactor.dart';
import 'package:simple_auth_1/typi_code/todos/interactor/todo_list_state.dart';
import 'package:simple_auth_1/utils/logger.dart';
import 'package:simple_auth_1/widget/platform_progress.dart';

class TodoListPage extends StatefulWidget {
  DbNoteRouter? router;

  TodoListPage({this.router, Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  late TodoListInteractor pageProvider;

  String getTitle() {
    return "TodoList Page";
  }

  CustomAppBar getAppBar(BuildContext context, TodoListState state) {
    return CustomAppBar(getTitle(), appBarActions: getAppBarAction(), hideBackButton: true,);
  }

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
  void initState() {
    // TODO: implement initState
    super.initState();

    BlocProvider.of<TodoListCubit>(context).loadData();

  }

  @override
  Widget build(BuildContext context) {
    pageProvider = BlocProvider.of<TodoListInteractor>(context);

    // return Container();
    return BlocConsumer<TodoListInteractor, TodoListState>(listener: (context, state) {
      // Show toast event at here
      if (state is TodoListGetDataError) {
        // showToast(state.error.messenger);
        // showErrorSnackbar(state.error.messenger, context);
        eLog("blocConsumerListener");
      }
    }, buildWhen: (previousState, currentState) {
      eLog("blocConsumerBuildWhen");
      if (currentState is TodoListGetDataError) {
        // showToast(state.error.messenger);
        // showErrorSnackbar(state.error.messenger, context);
        return false;
      }
      return true;
    }, builder: (context, state) {
      return Scaffold(
        appBar: getAppBar(context, state),
        body: getBody(context, state),
      );
    });
  }

  Widget getBody(BuildContext context, TodoListState state) {
    if (state is TodoListInProgress) {
      return const Center(child: PlatformProgress());
    } else if (state is TodoListGetDataError) {
      //var state = state as TodoListGetDataError;
      // show loi
      // showErrorSnackbar(state.error.messenger, context);
      // showToast(state.error.messenger);
    }

    return _listView(context, state);

    // return _buildTodosList(context, state);
  }

  // @override
  // State<StatefulWidget> createState() {
  //   return _TodoListPageState();
  // }

  Widget _buildTodosList(BuildContext context, TodoListState state) {

    List<Todo> items = [];
    if (state is TodoListGetDataSuccess) {
      // var state = state as TodoListGetDataSuccess;
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
            onRefresh: () async {
              eLog("reload data");
              // await Future.delayed(const Duration(seconds: 2));
              // await pageProvider.loadData();
            },

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
        /// if (state is TodoListInLoadMoreProgress) const PlatformProgress()
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

  Widget _listView(BuildContext context, TodoListState state) {
    List<Todo> items = [];
    if (state is TodoListGetDataSuccess) {
      items = state.items;
    }

    return RefreshIndicator(
      onRefresh: () async {
        eLog("reload data");
        // await Future.delayed(const Duration(seconds: 2));
        await pageProvider.onRefresh();
      },
      child: LoadMore(
        isFinish: false,
        onLoadMore: _loadMore,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Container(
              child: Text(items[index].title.toString()),
              height: 80.0,
              alignment: Alignment.center,
            );
          },
          itemCount: items.length,
        ),
        whenEmptyLoad: true,
        delegate: DefaultLoadMoreDelegate(),
        // textBuilder: DefaultLoadMoreTextBuilder.chinese,
      ),
      color: Colors.white,
      backgroundColor: Colors.purple,
      triggerMode: RefreshIndicatorTriggerMode.anywhere,
    );
  }

  Future<bool> _loadMore() async {
    eLog("onLoadMore");
    await Future.delayed(const Duration(seconds: 0, milliseconds: 2000));
    pageProvider.loadMoreData();
    // load();
    return true;
  }


}


class BottomLoader extends StatelessWidget {
  const BottomLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Center(
        child: SizedBox(
          width: 33,
          height: 33,
          child: CircularProgressIndicator(
            strokeWidth: 1.5,
          ),
        ),
      ),
    );
  }
}

