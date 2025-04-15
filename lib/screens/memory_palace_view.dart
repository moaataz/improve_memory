import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MemoryPalaceView extends StatefulWidget {
  const MemoryPalaceView({required this.url, super.key});
  final String url;
  @override
  State<MemoryPalaceView> createState() => _MemoryPalaceViewState();
}

class _MemoryPalaceViewState extends State<MemoryPalaceView> {
  final controller = WebViewController();
  @override
  void initState() {
    controller.loadRequest(Uri.parse(widget.url));
    controller.setJavaScriptMode(JavaScriptMode.unrestricted);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_back)),
          )
        ],
      ),
    );
  }
}
