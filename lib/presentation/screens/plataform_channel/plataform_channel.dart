import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PlatformChannelExample extends StatefulWidget {
  const PlatformChannelExample({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _PlatformChannelExampleState createState() => _PlatformChannelExampleState();
}

class _PlatformChannelExampleState extends State<PlatformChannelExample> {
  static const platform = MethodChannel('com.example.time');
  String _currentTime = 'Unknown';

  Future<void> getCurrentTime() async {
    try {
      final String result = await platform.invokeMethod('getCurrentTime');
      setState(() {
        _currentTime = result;
      });
    } on PlatformException catch (e) {
      setState(() {
        _currentTime = "Failed to get time: '${e.message}'.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Platform Channel')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Tempo atual: $_currentTime'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: getCurrentTime,
              child: const Text('Tempo nativo'),
            ),
          ],
        ),
      ),
    );
  }
}
