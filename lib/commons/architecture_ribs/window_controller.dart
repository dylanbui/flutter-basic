/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 15/08/2022 - 11:06
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'note_viewer.dart';

/// The controller used for launching [ViewControllable]
class WindowController {
  static final navigator = GlobalKey<NavigatorState>();

  /// Pushes this view to the top of the [Navigator] stack
  static present(ViewControllable viewControllable) async {
    navigator.currentState?.push(MaterialPageRoute(
      builder: (context) => viewControllable,
      settings: RouteSettings(arguments: viewControllable),
    ));
  }

  static dismiss(ViewControllable viewControllable) {
    Route? previousRoute;

    navigator.currentState?.popUntil((route) {
      final result = previousRoute?.settings?.arguments == viewControllable;
      previousRoute = route;
      return result;
    });
  }

  final _currentView = null; // ValueNotifier<ViewControllable>(null);

  ValueNotifier<ViewControllable> get currentView => _currentView;

  void launch(ViewControllable view) {
    _currentView.value = view;
  }
}

/// The root Window class for launching [ViewControllable]
class Window extends StatelessWidget {

  Window(this.controller);

  final WindowController controller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.currentView,
      builder: (context, value, child) {
        return value as Widget ?? Container();
      },
    );
  }
}