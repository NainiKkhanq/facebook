import 'package:flutter/material.dart';
import 'package:thread/models/suggested_followersModel.dart';

class SuggestedFollowersWidgets extends StatelessWidget {
  
   SuggestedFollowersWidgets({super.key,required this.suggestedFollowersModel});

   SuggestedFollowersModel suggestedFollowersModel;

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        ListTile(
          title:  Text(suggestedFollowersModel.UserName),
          leading:  CircleAvatar(
            backgroundImage: NetworkImage(suggestedFollowersModel.ProfileImageUrl),
          ),
          subtitle: const Text("New User"),
          trailing: Container(
            height: 34,
            width: 110,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey),borderRadius: BorderRadius.circular(8)),
            child:  Center(child: suggestedFollowersModel.isfollowing?const Text("Following",style: TextStyle(color: Colors.grey)):const Text("Follow",)),
          ),
        ),
        const Divider()
      ],
    );
  }
}
