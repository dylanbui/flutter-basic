/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 27/07/2022 - 09:36
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';

// import 'package:html_editor_enhanced/utils/utils.dart';
import 'package:simple_auth_1/commons/architecture_ribs/note_router.dart';
import 'package:simple_auth_1/commons/base_statefull_widget.dart';
import 'package:simple_auth_1/login_scene/text_editor/interactor/text_editor_provider.dart';
import 'package:simple_auth_1/utils/logger.dart';
import 'package:simple_auth_1/widget/text_editor_widget.dart';

class TextEditorPage extends BaseStateFulWidget {
  final String title = "TextEditor Page";

  TextEditorPage({Key? key, DbNoteRouter? router}) : super(key: key, router: router);

  @override
  State<StatefulWidget> createState() {
    return _TextEditorPageState();
  }
}

class _TextEditorPageState extends BaseState<TextEditorPage, TextEditorProvider> implements TextEditorListener {
  final HtmlEditorController controller = HtmlEditorController();
  String contentHtml = "<p>text content initial, <b>if any</b></p>";

  @override
  void initState() {
    super.initState();
  }

  @override
  void onSave(String content) {
    // Noi dung than thanh
    wtfLog(content);

    setState(() {
      contentHtml = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                controller.getText().then((value) {
                  wLog(value);
                });
                // Clear text editor
                // controller.editorController?.reload();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.toggleCodeView();
        },
        child: const Text(r'<\>', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // HtmlEditor(
            //   controller: controller,
            //   htmlEditorOptions: const HtmlEditorOptions(
            //     // hint: 'Your text here...',
            //     shouldEnsureVisible: true,
            //     initialText: "<p>text content initial, if any</p>",
            //   ),
            //   htmlToolbarOptions: HtmlToolbarOptions(
            //     toolbarPosition: ToolbarPosition.aboveEditor,
            //     //by default
            //     toolbarType: ToolbarType.nativeScrollable,
            //     defaultToolbarButtons: [
            //       const OtherButtons(fullscreen: false, codeview: false, help: false, copy: false, paste: false),
            //       const FontButtons(clearAll: false, strikethrough: false, superscript: false, subscript: false),
            //       const ListButtons(listStyles: false),
            //     ],
            //     customToolbarButtons: [],
            //     customToolbarInsertionIndices: [],
            //     onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
            //       wLog("button '${describeEnum(type)}' pressed, the current selected status is $status");
            //       return true;
            //     },
            //   ),
            //   otherOptions: const OtherOptions(
            //     height: 100,
            //   ),
            // ),
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Text("------"),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.blueGrey),
                    onPressed: () {
                      var textEditorWidget = TextEditorWidget(
                        title: "Html editor",
                        content: contentHtml,
                        listener: this,
                      );
                      Navigator.push(context, MaterialPageRoute(builder: (context) => textEditorWidget));
                      // controller.disable(); // Disable Text editor
                    },
                    child: const Text('Html editor', style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("Day la noi dung html, bam vao de edit"),
            ),
            GestureDetector(
              onTap: () {
                var textEditorWidget = TextEditorWidget(
                  title: "Html editor",
                  content: contentHtml,
                  listener: this,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => textEditorWidget));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Html(
                  data: contentHtml,
                )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
