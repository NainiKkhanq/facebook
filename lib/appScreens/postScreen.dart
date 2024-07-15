import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PostScreen extends StatefulWidget {
  PanelController panelController;
     PostScreen({super.key,  required this.panelController});

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
              widget.panelController.close(); 
              }, child: const Text("Close",style: TextStyle(fontWeight: FontWeight.bold),)),
             const Text("New Thread",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
             TextButton(onPressed: (){
            
              
             }, child: const Text("Post",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),)),

            ],),
            const   Divider(thickness: 1.0,),

            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                   const CircleAvatar(
                    foregroundImage: NetworkImage("https://media.istockphoto.com/id/1476170969/photo/portrait-of-young-man-ready-for-job-business-concept.webp?b=1&s=170667a&w=0&k=20&c=FycdXoKn5StpYCKJ7PdkyJo9G5wfNgmSLBWk3dI35Zw="),
                    radius:   25,
                  ),
                 const SizedBox(width: 20,),
                  Expanded(child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
              
                    children: [
                      const Text("Hasnain",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText:"Enter Thread",
                          hintStyle: TextStyle(fontSize: 14),
                          border: InputBorder.none
                        ),
                        maxLines: null,
                      )
                  ],))
              ],),
            )
        
        ],),
      ));
    
  }
}