/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/07/2022 - 13:52
 * To change this template use File | Settings | File Templates.
 */

// Provider

import 'package:simple_auth_1/commons/base_provider.dart';
import 'package:simple_auth_1/main.dart';
import 'package:simple_auth_1/utils/logger.dart';

class OpenWebViewProvider extends BaseProvider {

  OpenWebViewProvider() {
    isLoading = true;


    globalEventBus.on().listen((event) {
      // Print the runtime type. Such a set up could be used for logging.
      dLog(event.runtimeType.toString());
    });

  }

}