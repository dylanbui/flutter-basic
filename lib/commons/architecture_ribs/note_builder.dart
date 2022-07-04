/*
 * Created with IntelliJ IDEA
 * Package: commons.architecture_ribs
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 04/07/2022 - 11:08
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';

abstract class DbNoteBuilder {

  // Dung buildContext khong co y nghia o day, moi context co the nghi no la 1 note trong cay
  // BuildContext buildContext;
  late Widget rootPage;

  DbNoteBuilder();

  void start(BuildContext fromContext);
  void startSameRootPage(BuildContext fromContext) {}

}