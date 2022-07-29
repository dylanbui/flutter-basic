/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/07/2022 - 13:52
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'open_web_view_provider.dart';

class OpenWebViewPage extends BaseStateFulWidget {

  final String title = "OpenWebView Page";
  final ChromeSafariBrowser browser = _MyChromeSafariBrowser();

  OpenWebViewPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {
    return _OpenWebViewPageState();
  }

}

class _OpenWebViewPageState extends BaseState<OpenWebViewPage, OpenWebViewProvider> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("ChromeSafariBrowser",)),
        // drawer: myDrawer(context: context),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                await widget.browser.open(
                    url: Uri.parse("https://flutter.dev/"),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(
                            shareState: CustomTabsShareState.SHARE_STATE_OFF,
                            isSingleInstance: false,
                            isTrustedWebActivity: false,
                            keepAliveEnabled: true),
                        ios: IOSSafariOptions(
                            dismissButtonStyle:
                            IOSSafariDismissButtonStyle.CLOSE,
                            presentationStyle:
                            IOSUIModalPresentationStyle.OVER_FULL_SCREEN)));
              },
              child: const Text("Open Chrome Safari Browser")),
        ));
  }

}

class _MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    dLog("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    dLog("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    dLog("ChromeSafari browser closed");
  }
}