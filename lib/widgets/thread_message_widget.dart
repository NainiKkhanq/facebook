import 'package:flutter/material.dart';
import 'package:thread/models/thread_messages_model.dart';

class ThreadMessageWidget extends StatelessWidget {
  

// Creating the instance of ThreadMessageModelClass..
  final ThreadMessageModel messageModel;

  const ThreadMessageWidget({
    super.key, required this.messageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  messageModel.senderProfileImageUrl),
              radius: 25,
            ),
           const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        messageModel.senderName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                 const     Spacer(),
                       Text(
                        _getDifference(messageModel.timeStamp)
                      ),
                      IconButton(onPressed: (){}, icon:const  Icon(Icons.more_horiz))
                    ],
                  ),
        
        
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text(messageModel.message.toString()),
        
                      Row(children: [
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.mode_comment_outlined)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.restart_alt_outlined)),
                        IconButton(onPressed: (){}, icon: Icon(Icons.send)),
                      ],)
                    ],
                  ),
        
                ],
              ),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
   // Setting Up Time Difference (Like 5 Seconds ago, 1 Hour Ago, 1 day ago like that)
/*
The major purpose of the code is to calculate the difference between the current
time and a provided timestamp in a human-readable format. We will provide the Posting TimeStamp to this code */

  String _getDifference(DateTime timeStamp) {
    // First of all we take the Current DateTime in now variable
    final now = DateTime.now();
    // Then we are getting the difference between that current time and the timestamp that we will provide
    final differnce = now.difference(timeStamp);

    /* Now we implement the conditions in which it will check if the difference between current time and timestamp is
     less than 1 minutes than we will show that thread was posted JustNow so it will works like for this for all conditions

    */
    if (differnce.inMinutes < 1) {
      return 'Just Now';
    } else if (differnce.inHours < 1) {
      return ' ${differnce.inMinutes}min';
    } else if (differnce.inDays < 1) {
      return '${differnce.inHours} hr';
    } else {
      return '${differnce.inDays} day';
    }
  }
}
