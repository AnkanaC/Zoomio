import 'package:flutter/material.dart';
import 'package:myapp/calling_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneh',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const VideoCallHomePage(),
    );
  }
}

class VideoCallHomePage extends StatefulWidget {
  const VideoCallHomePage({super.key});

  @override
  _VideoCallHomePageState createState() => _VideoCallHomePageState();
}

class _VideoCallHomePageState extends State<VideoCallHomePage> {
  final TextEditingController _meetingIdController = TextEditingController();

  void _handleJoin() {
    final meetingId = _meetingIdController.text;
    if (meetingId.isNotEmpty) {
      // Here you would implement the logic to join the meeting
      print('Joining meeting with ID: $meetingId');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color.fromARGB(255, 90, 252, 158), Color.fromARGB(255, 0, 144, 77)],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Sneh',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 6, 126, 10),
                      ),
                    ),
                    const SizedBox(height: 48),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextField(
                              controller: _meetingIdController,
                              decoration: InputDecoration(
                                hintText: 'Enter Meeting ID',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_meetingIdController.text.isNotEmpty) {
                                    // Check if the input is not empty
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder:
                                            (context) => CallingPage(callID: _meetingIdController.text,),
                                      ),
                                    );
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Meeting ID cannot be empty!',
                                        ),
                                      ),
                                    );
                                  }
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor:  Colors.lightGreen,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 16,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  'Join Meeting',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _meetingIdController.dispose();
    super.dispose();
  }
}
