import 'dart:async';

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  const WebViewWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text("Webview",style: TextStyle(fontSize: 20),),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<WebViewScreen>(
                  builder: (BuildContext context) => const WebViewScreen(),
                ),
              );
            },
            child: const Text('Launch Web View'),
          ),
        ],
      ),
    );
  }
}


class WebViewScreen extends StatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  WebViewScreenState createState() => WebViewScreenState();
}

class WebViewScreenState extends State<WebViewScreen> {

  final Completer<WebViewController> _controller =
  Completer<WebViewController>();

  bool _isLoading = false;
  String _title = '';


  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
  }
  Widget _buildBody() {
    return Column(
      children: [
        if (_isLoading) const LinearProgressIndicator(),
        Expanded(
          child: _buildWebView(),
        ),
      ],
    );
  }

  Widget _buildWebView() {
    return WebView(
      initialUrl: 'https://flutter.dev',
      // jsを有効化
      javascriptMode: JavascriptMode.unrestricted,
      // controllerを登録
      onWebViewCreated: _controller.complete,
      // ページの読み込み開始
      onPageStarted: (String url) {
        // ローディング開始
        setState(() {
          _isLoading = true;
        });
      },
      // ページ読み込み終了
      onPageFinished: (String url) async {
        // ローディング終了
        setState(() {
          _isLoading = false;
        });
        // ページタイトル取得
        final controller = await _controller.future;
        final title = await controller.getTitle();
        setState(() {
          if (title != null) {
            _title = title;
          }
        });
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: _buildBody(),
    );
  }
}
