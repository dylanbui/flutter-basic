/*
 * Created with IntelliJ IDEA
 * Package: commons.architecture_ribs
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 11:08
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';

import 'note_view_controllable.dart';


/// The base dependency protocol.
///
/// Subclasses should define a set of properties that are required by the module from the DI graph. A dependency is
/// typically provided and satisfied by its immediate parent module.
abstract class DbNoteDependency {}

/// The special empty dependency.
abstract class DbNoteEmptyDependency extends DbNoteDependency {}

/// The base builder protocol that all builders should conform to.
abstract class DbNoteBuildable {}


/// Utility that instantiates a RIB and sets up its internal wirings.
class DbNoteBuilder<T extends DbNoteDependency> extends DbNoteBuildable {
  /// The dependency used for this builder to build the RIB.
  final T? dependency;

  late Widget rootPage;

  late NoteViewControllable viewControllable;

  /// Initializer.
  ///
  /// - parameter dependency: The dependency used for this builder to build the RIB.
  DbNoteBuilder({this.dependency});
}

///////////////////////////////


// abstract class DbNoteBuilder {
//
//   // Dung buildContext khong co y nghia o day, moi context co the nghi no la 1 note trong cay
//   // BuildContext buildContext;
//   late Widget rootPage;
//
//   DbNoteBuilder();
//
//   void start(BuildContext fromContext);
//   void startSameRootPage(BuildContext fromContext) {}
//
// }