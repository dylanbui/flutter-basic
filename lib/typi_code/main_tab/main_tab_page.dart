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
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/typi_code/comments/comment_builder.dart';
import 'package:simple_auth_1/typi_code/photos/photo_builder.dart';
import 'package:simple_auth_1/typi_code/posts/post_builder.dart';
import 'package:simple_auth_1/utils/logger.dart';


import '../../commons/base_statefull_widget.dart';
import '../../widget/fade_indexed_stack.dart';
import 'main_tab_provider.dart';

//ignore: must_be_immutable
class MainTabPage extends BaseStateFulWidget {

  final String title = "Login Page";

  MainTabPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {

    return _MainTabPageState();
  }
}

// Cach 1: chay tot su dung them animation change tab
class _MainTabPageState extends BaseState<MainTabPage, MainTabProvider> with WidgetsBindingObserver {

  late AppLifecycleState _notification;
  var _selectedIndexPage = 0;
  final List<DbNoteBuilder> _pages = [PostBuilder(showAppBarOnRootPage: false)];

  int get _indexPageInList {
    switch (_selectedIndexPage) {
    /* Home Page */
      case 0:
        return _pages.indexWhere((page) => page is PostBuilder);
      case 1:
        return _pages.indexWhere((page) => page is CommentBuilder);
      default:
        return 0;
    }
  }

  void _navigateToPage(int index) {
    switch (index) {
      case 0:
        if (_pages.indexWhere((page) => page is PostBuilder) == -1) _pages.add(PostBuilder(showAppBarOnRootPage: false));
        break;
      case 1:
        if (_pages.indexWhere((page) => page is CommentBuilder) == -1) _pages.add(CommentBuilder(showAppBarOnRootPage: false));
        break;
    }
    setState(() {
      _selectedIndexPage = index;
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        {
          // _updateCurrentUserStatus(true);
          iLog("AppLifecycleState.resumed");
          break;
        }
      case AppLifecycleState.inactive:
        {
          iLog("AppLifecycleState.inactive");
          break;
        }
      case AppLifecycleState.paused:
        {
          // _updateCurrentUserStatus(false);
          iLog("AppLifecycleState.paused");
          break;
        }
      case AppLifecycleState.detached:
        {
          // _updateCurrentUserStatus(false);
          iLog("AppLifecycleState.detached");
          break;
        }
    }
  }

  @override
  Widget? getLayout(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: appBar(),
      body: FadeIndexedStack(
        index: _indexPageInList,
        children: _pages.map((coordinator) => coordinator.rootPage).toList(),
      ),
      drawer: leftMenu(),
      bottomNavigationBar: bottomTabbar(),
    );

  }

  AppBar appBar() {
    return AppBar(
      // AppBar title se nen lay theo page chon
      title: const Text("AppBar title"),
      leading: Builder(
        builder: (BuildContext context) {
          return RotatedBox(
            quarterTurns: 1,
            child: IconButton(
              icon: const Icon(Icons.bar_chart_rounded, color: Colors.white,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          );
        },
      ),
      // backgroundColor: Colors.redAccent,
      elevation: 0.0,
      actions: [
        IconButton(
            color: Colors.white,
            icon: const Icon(Icons.search),
            onPressed: () {
              // Navigator.pushNamed(context, '/search');
              dLog("Search action on Tabbar Page");
            }),
      ],
    );
  }

  Drawer leftMenu() {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            title: const Text('Photo List'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
              PhotoBuilder().start(context);
            },
          ),
          ListTile(
            title: const Text('Demo Alert Dialog'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
              // PhotoCoordinator().startDemoAlert(context);
            },
          ),
          ListTile(
            title: const Text('Demo Layout'),
            onTap: () {
              // Update the state of the app
              // Then close the drawer
              Navigator.pop(context);
              // PhotoCoordinator().startDemoLayout(context);
            },
          ),
        ],
      ),);
  }

  BottomNavigationBar bottomTabbar() {
    return BottomNavigationBar(
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
    );
  }
}



/*
// // Cach 2: chay tot
class _MainTabPageState extends BaseState<MainTabPage, MainTabProvider> {


  var _selectedIndexPage = 0;
  final Widget _post = PostCoordinator().rootPage;
  final Widget _comment = CommentCoordinator().rootPage;

  void _navigateToPage(int index) {
    setState(() {
      _selectedIndexPage = index;
    });
  }

  Widget getTab()  {
    if(_selectedIndexPage == 0) {
      return _post;
    } else if(_selectedIndexPage == 1) {
      return _comment;
    }
    return _comment;
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
      body: getTab(),
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

*/

