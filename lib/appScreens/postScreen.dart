
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PostScreen extends StatefulWidget {
  PanelController panelController;
     PostScreen({super.key,  required this.panelController});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
    final messageController = TextEditingController();
    String userName = "";
      final currentUser = FirebaseAuth.instance.currentUser;
    // Creating a Method which will handle the Thread Message 

    Future<void> postThreadMessage()async{
        try {
          
          if(messageController.text.isNotEmpty){
            await FirebaseFirestore.instance.collection('Threads').add({
              'id': currentUser!.uid.toString(),
              'sender': userName,
              'thread': messageController.text.toString(),
              'time': FieldValue.serverTimestamp()
            });
            messageController.clear();
            widget.panelController.close();
          }

        } catch (e) {
          rethrow;
             }

    }

    // Creating a Method to Get the Current Logged in UserName from firestore

    Future<void> getCurrentUsername()async{
      try {
        final userdoc = await FirebaseFirestore.instance.collection('Users').doc(currentUser!.uid)
        // .GET WILL GET ALL DATA FOR A SPECIFIC USER
        .get();
        // So if mounted it means that if the Data is received we can do further action
        if(mounted){
          setState(() {
            userName = userdoc['userName'];
          });
        }
      } catch (e) {
          rethrow;
      }
    }

    // Calling initState method

    @override
  void initState() {
    // When Screen will called firstly we will call the getCurrentUsername() method to get the username
    getCurrentUsername();

        super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              TextButton(onPressed: (){
              widget.panelController.close(); 
              }, child: const Text("Close",style: TextStyle(fontWeight: FontWeight.bold),)),
             const Text("New Thread",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
             TextButton(
              // Called the Thread Posting Message this will send the Thread to the Firestore
              onPressed: postThreadMessage, child: const Text("Post",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),

            ],),
            const   Divider(thickness: 1.0,),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                   const CircleAvatar(
                    foregroundImage: NetworkImage("https://assets.about.me/background/users/n/k/t/nktechtube_1658465013_975.jpg"),
                    radius:   25,
                  ),
                 const SizedBox(width: 20,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              
                    children: [
                       Text(userName,style: const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      TextFormField(
                        controller: messageController,
                        decoration: const InputDecoration(
                          hintText:"Enter Thread",
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none
                        ),
                        style: const TextStyle(fontSize: 14.0),
                        maxLines: null,
                      )
                  ],))
              ],),
            )
        
        ],),
      ));
    
  }
}