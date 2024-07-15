import 'package:flutter/material.dart';
import 'package:thread/models/suggested_followersModel.dart';
import 'package:thread/widgets/suggested_followers_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      body: SafeArea(child: 
      
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Search",style: TextStyle(
              
                fontSize: 28
              ),),
          
          Container(
            margin: const EdgeInsets.only(top: 12.0),
            height: 35,
            width: double.infinity,
            decoration:  BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12)
            ),
            child: TextFormField(
              
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(Icons.search),
              ),
            ),
          ),

          const SizedBox(height: 20,),
          // Calling the Suggested Followers Widget class which we created

            ...suggested_followersModelList.map((follower){
              return SuggestedFollowersWidgets(suggestedFollowersModel: follower);
              // 1:10:44
            }).toList()
            ],
          ),
        ),
      ))
      
      );
    
  }
}