/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 26/07/2022 - 10:52
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/utils/logger.dart';

import 'flex_home_provider.dart';

class FlexHomePage extends BaseStateFulWidget {

  final String title = "FlexHome Page";

  FlexHomePage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {
    return _FlexHomePageState();
  }

}

class _FlexHomePageState extends BaseState<FlexHomePage, FlexHomeProvider> {

  final GlobalKey webViewKey = GlobalKey();
  double progress = 0;

  @override
  void initState() {
    super.initState();
    // progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
  }

  @override
  Widget getLayout(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(
          widget.title,
        )),
        // drawer: myDrawer(context: context),
        body: Center(
            child: Stack(
              children: [
                InAppWebView(
                  key: webViewKey,
                  // contextMenu: contextMenu,
                  initialUrlRequest: URLRequest(url: Uri.parse("https://virtual.flexhome.asia/en/tour/victoria-vinh-05a-1649904189634")),
                  onLoadStart: (controller, url) {
                    dLog("onLoadStart");
                  },
                  onLoadStop: (controller, url) async {
                    dLog("onLoadStop");
                  },
                  onLoadError: (controller, url, code, message) {
                    dLog("onLoadError");
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      dLog("progress ==== 100");
                    }
                    setState(() {
                      this.progress = progress / 100;
                    });

                  },
                ),
                progress < 1.0 ? LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.white10,
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.yellow), ) : Container(),
              ],
            ),
        )
    );
  }

}



