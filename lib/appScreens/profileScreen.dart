import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(length: 3, child: Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const ListTile(
              title: Text("Hasnain"),
              subtitle: Text("@hasnain"),
              contentPadding: EdgeInsets.all(0),
              trailing: CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage("https://media.istockphoto.com/id/1476170969/photo/portrait-of-young-man-ready-for-job-business-concept.webp?b=1&s=170667a&w=0&k=20&c=FycdXoKn5StpYCKJ7PdkyJo9G5wfNgmSLBWk3dI35Zw="),
              ),
        
            ),
           const Text("Bio Needs to there..."),
          const  Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text("100 Followers",style: TextStyle(color: Colors.grey),),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.5),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                
                children: [
                
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 30,
                    width: 120,
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                    
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                  child: const Text("Edit Profile"),
                  ),
                ),
                InkWell(
                  onTap: (){},
                  child: Container(
                    height: 30,
                    width: 120,
                  alignment: Alignment.center,
                    decoration: BoxDecoration(
                    
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      
                    ),
                  child: const Text("Share Profile"),
                  ),
                )
              ],),
            ),

              const SizedBox(height: 25,),
              const TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.black,
                tabs: [
                Tab(text: "Thread"),
                Tab(text: "Replies"),
                Tab(text: "Reposts"),
              ]),

              const Expanded(child: TabBarView(children: [
                Center(child: Text("Your Threads")),
                Center(child: Text("Your Replies")),
                Center(child: Text("Your Reposts")),

              ]))

          ],
        ),
      ),),
    ));
  }
}