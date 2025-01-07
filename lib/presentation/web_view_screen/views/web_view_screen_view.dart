import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:salon_symphony/baseviews/baseview_process_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/web_view_screen_controller.dart';

class WebViewScreenView extends GetView<WebViewScreenController> {
  WebViewScreenView();

  dynamic name = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return BaseviewScreen(
      screenName: '${name[0]}',
      basicAppBar: true,
      showBottomBar: false,
      mainTopHeight: 0.5,
      sidePadding: false,
      child: Center(
          child: WebView(
        initialUrl: name[0] == 'PDF'
            ? 'https://docs.google.com/gview?embedded=true&url=http://www.africau.edu/images/default/sample.pdf'
            : name[0] == 'Video'
                ? 'https://www.youtube.com/watch?v=EngW7tLk6R8'
                : 'https://samplelib.com/lib/preview/mp3/sample-3s.mp3',
              javascriptMode: JavascriptMode.unrestricted
      )),
    );
  }

}
