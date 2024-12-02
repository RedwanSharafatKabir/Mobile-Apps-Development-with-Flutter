import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LiveStreamScreen(),
    );
  }
}

class LiveStreamScreen extends StatefulWidget {
  @override
  _LiveStreamScreenState createState() => _LiveStreamScreenState();
}

class _LiveStreamScreenState extends State<LiveStreamScreen> {
  static const platform = MethodChannel('com.example.live_stream_flutter/stream');
  final TextEditingController urlController = TextEditingController();

  Future<void> startStream(String url) async {
    try {
      await platform.invokeMethod('startStream', {'url': url});
    } on PlatformException catch (e) {
      debugPrint("Error starting stream: ${e.message}");
    }
  }

  Future<void> stopStream() async {
    try {
      await platform.invokeMethod('stopStream');
    } on PlatformException catch (e) {
      debugPrint("Error stopping stream: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Stream'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: urlController,
              decoration: const InputDecoration(
                labelText: 'RTSP URL',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () => startStream(urlController.text),
                  child: const Text('Start Stream'),
                ),
                ElevatedButton(
                  onPressed: stopStream,
                  child: const Text('Stop Stream'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
