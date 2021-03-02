import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomLoaderView extends StatefulWidget {

  final String initialUrl;

  const CustomLoaderView({

    this.initialUrl,

  });


  @override

  _FCustomLoaderViewState createState() =>

      _FCustomLoaderViewState();
}



class _FCustomLoaderViewState extends State<CustomLoaderView> {

  bool isInitialLoaded = false;


  void onPageFinished(String url) {
    if (!isInitialLoaded) {
      setState(() => isInitialLoaded = true);
    }
  }


  @override
  Widget build(BuildContext context) {

      return Opacity(

        opacity: isInitialLoaded ? 1 : 0,

        child: WebView(

          initialUrl: widget.initialUrl,

          javascriptMode: JavascriptMode.unrestricted,

          onPageFinished: (String url) {
            if (!isInitialLoaded) {
              setState(() => isInitialLoaded = true);
            }
          },

        ),

      );
  }
}