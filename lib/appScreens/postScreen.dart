import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
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
              
              }, child: const Text("Close",style: TextStyle(fontWeight: FontWeight.bold),)),
             const Text("New Thread",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
             TextButton(onPressed: (){
            
              
             }, child: const Text("Post",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),

            ],),
            const   Divider()
        
        ],),
      ));
    
  }
}