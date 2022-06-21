/*
 * Created with IntelliJ IDEA
 * Package: typi_code
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 21/06/2022 - 17:28
 * To change this template use File | Settings | File Templates.
 */

// https://blog.logrocket.com/how-to-build-a-bottom-navigation-bar-in-flutter/

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_auth_1/typi_code/comments/comment_list_page.dart';
import 'package:simple_auth_1/typi_code/comments/comment_list_provider.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_page.dart';
import 'package:simple_auth_1/typi_code/posts/post_list_provider.dart';

import '../commons/base_statefull_widget.dart';
import '../commons/coordinator/constants.dart';
import '../widget/fade_indexed_stack.dart';
import 'main_tab_provider.dart';

//ignore: must_be_immutable
class MainTabPage extends BaseStateFulWidget {

  final String title = "Login Page";

  MainTabPage({Key? key, DbNavigation? nav}) : super(key: key, nav: nav);

  @override
  State<StatefulWidget> createState() {
    return _MainTabPageState();
  }
}


class _MainTabPageState extends BaseState<MainTabPage, MainTabProvider> {

  var _selectedIndexPage = 0;
  final List<Widget> _pages = [PostListPage()];

  int get _indexPageInList {
    switch (_selectedIndexPage) {
    /* Home Page */
      case 0:
        return _pages.indexWhere((page) => page is PostListPage);
      case 1:
        return _pages.indexWhere((page) => page is CommentListPage);
      default:
        return 0;
    }
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        if (_pages.indexWhere((page) => page is PostListPage) == -1) _pages.add(PostListPage());
        break;
      case 1:
        if (_pages.indexWhere((page) => page is CommentListPage) == -1) _pages.add(CommentListPage());
        break;
    }
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget? getLayout(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: MultiProvider(providers: [
        ChangeNotifierProvider(create: (ctx) => PostListProvider()),
        ChangeNotifierProvider(create: (ctx) => CommentListProvider()),
      ],
        child: IndexedStack(
          index: _indexPageInList,
          children: _pages,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: _navigateToPage,
        backgroundColor: Theme.of(context).canvasColor,
        unselectedItemColor: const Color(0x4D000000),
        selectedItemColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        currentIndex: _selectedIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            backgroundColor: Theme.of(context).canvasColor,
            label: "Post",
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.list),
            backgroundColor: Theme.of(context).canvasColor,
            label: "Comment",
          ),
        ],
      ),
    );

  }


}

