/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 07/07/2022 - 19:34
 * To change this template use File | Settings | File Templates.
 */


import 'package:flutter/material.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_builder.dart';

// Listener

// Buildable

abstract class UserListBuildable extends DbNoteBuildable {

  Widget build();

}

// Builder

class UserListBuilder extends DbNoteBuilder implements UserListBuildable {
  @override
  Widget build() {
    // TODO: implement build
    throw UnimplementedError();
  }
}
 
 

