/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 15/08/2022 - 14:37
 * To change this template use File | Settings | File Templates.
 */


import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';

abstract class NoteInteractor<T extends DbNoteRouter> {

  /// The dependency used for this builder to build the RIB.
  T? router;

  /// Initializer.
  ///
  /// - parameter dependency: The dependency used for this builder to build the RIB.
  NoteInteractor({this.router});



}