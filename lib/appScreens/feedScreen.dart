import 'package:flutter/material.dart';
import 'package:thread/widgets/thread_message.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return  const SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(20.0),
              child: Column(
                children: [

                  ThreadMessage(),
                  ThreadMessage(),
                  ThreadMessage(),
                  ThreadMessage(),
                  ThreadMessage(),
                  ThreadMessage(),
                  
                ],
              )
            ),
           

          ],
        ),
      ),
    ));
  }
}

