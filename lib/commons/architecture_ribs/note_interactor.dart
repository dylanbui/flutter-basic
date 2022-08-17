/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 15/08/2022 - 14:37
 * To change this template use File | Settings | File Templates.
 */


import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

/// The base builder protocol that all builders should conform to.
abstract class DbNoteInteractable {}

//Interactable
abstract class DbNoteInteractor<T extends DbNoteRouter> implements DbNoteBuildable {

  /// The dependency used for this builder to build the RIB.
  T? router;

  /// Initializer.
  ///
  /// - parameter dependency: The dependency used for this builder to build the RIB.
  DbNoteInteractor({this.router});

}

// Dang thu nghiem Presentable

/// The base protocol for all `Presenter`s.
abstract class DbNotePresentable {}

/// The base class of all `Presenter`s. A `Presenter` translates business models into values the corresponding
/// `ViewController` can consume and display. It also maps UI events to business logic method, invoked to
/// its listener.
class DbNotePresenter<ViewControllerType> extends DbNotePresentable {
  /// The view controller of this presenter.
  final ViewControllerType viewController;

  /// Initializer.
  ///
  /// - parameter viewController: The `ViewController` of this `Pesenters`.
  DbNotePresenter(this.viewController);
}