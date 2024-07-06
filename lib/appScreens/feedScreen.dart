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
    return   SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Image.network("https://res.cloudinary.com/datit6fwc/image/upload/v1720206749/1688663318threads-logo-white_vfrn53.png",width: 50,),
                  const ThreadMessage(),
                  const ThreadMessage(),
                  const ThreadMessage(),
                  const ThreadMessage(),
                  const ThreadMessage(),
                  const ThreadMessage(),

                ],
              )
            ),
           

          ],
        ),
      ),
    ));
  }
}

