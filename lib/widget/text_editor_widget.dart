/*
 * Created with IntelliJ IDEA
 * Package: 
 * User: dylanbui
 * Email: duc@propzy.com
 * Date: 29/07/2022 - 14:03
 * To change this template use File | Settings | File Templates.
 */

import 'package:flutter/material.dart';
import 'package:html_editor_enhanced/html_editor.dart';

abstract class TextEditorListener {
  void onSave(String content);
}

class TextEditorWidget extends StatelessWidget {

  final String? title;
  final String? content;
  final TextEditorListener? listener;

  TextEditorWidget({Key? key, this.title, this.content, this.listener}) : super(key: key);

  final HtmlEditorController controller = HtmlEditorController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? ""),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                controller.getText().then((value) {
                  // wLog(value);
                  listener?.onSave(value);
                  Navigator.pop(context);
                });
                // Clear text editor
                // controller.editorController?.reload();
              }),
          IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.pop(context);
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
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: const HtmlEditorOptions(
                // hint: 'Your text here...',
                shouldEnsureVisible: true,
                // initialText: "<p>text content initial, if any</p>",
              ),
              htmlToolbarOptions: HtmlToolbarOptions(
                toolbarPosition: ToolbarPosition.aboveEditor,
                //by default
                toolbarType: ToolbarType.nativeScrollable,
                defaultToolbarButtons: [
                  const OtherButtons(fullscreen: false, codeview: false, help: false, copy: false, paste: false),
                  const FontButtons(clearAll: false, strikethrough: false, superscript: false, subscript: false),
                  const ListButtons(listStyles: false),
                ],
                customToolbarButtons: [],
                customToolbarInsertionIndices: [],
                onButtonPressed: (ButtonType type, bool? status, Function? updateStatus) {
                  // wLog("button '${describeEnum(type)}' pressed, the current selected status is $status");
                  return true;
                },
              ),
              otherOptions: OtherOptions(height: MediaQuery.of(context).size.height - 105),
              callbacks: Callbacks(onBeforeCommand: (String? currentHtml) {

              }, onInit: () {
                // Clear text editor
                // Insert first data
                controller.setText(content ?? "");
              }),
            )
          ],
        ),
      ),
    );
  }
}


