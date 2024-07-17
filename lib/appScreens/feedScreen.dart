import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:thread/models/thread_messages_model.dart';
import 'package:thread/widgets/thread_message_widget.dart';

class FeedScreen extends StatefulWidget {
  const FeedScreen({super.key});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  // Data from threads collections will be called in this variabel which is threadCollection.
  final CollectionReference threadCollection =
      FirebaseFirestore.instance.collection('Threads');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Center(
                        child: Image.network(
                      "https://res.cloudinary.com/datit6fwc/image/upload/v1720206749/1688663318threads-logo-white_vfrn53.png",
                      width: 50,
                    )),
                    StreamBuilder(
                        stream: threadCollection.snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Colors.grey,
                              ),
                            );
                          } else if (snapshot.connectionState ==
                              ConnectionState.none) {
                            return const Center(
                              child: Text(
                                  "Check Your Internet Connection and Try Again!"),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text(snapshot.error.toString()),
                            );
                          }
        
                          // this threadMessages will get the all from Thread collection and save it
                          //..snapshot contains the complete collection of Threads so using this snapshot we get the data
                          final threadMessages = snapshot.data!.docs;
                          return Column(
                            children: [
                              SizedBox(
                                
                                height: MediaQuery.of(context).size.height,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: threadMessages.length,
                                  itemBuilder: (context, index) {
                                    // In MessaegData variable we call the threadMessaages in which Thread Collection is saved
                                    // And we pass the Index in that Variable and taking data as a Map and type is String and dynamic
                                
                                    final messageData =
                                        threadMessages[index].data()
                                            as Map<String, dynamic>;
                                
                                    // Getting DateTime and To find the Exact post time
                                    DateTime timeStamps = DateTime.now();
                                    // Checking Two Conidtion 1st is: messaegData Map contains Time or not
                                    // 2nd is Time is != null.
                                    if (messageData.containsKey('time') &&
                                        messageData['time'] != null) {
                                      // Now  we use the timeStamp Variable and saving the time that we are getting are from Firebase Database
                                      // And converting it to TimeStamp (taking as TimeStamp) and change it toDaate()
                                      // Now we will set that time stamp on Thread message and show the exact time how long before this post was uploaded
                                      timeStamps =
                                          (messageData['time'] as Timestamp)
                                              .toDate();
                                    }
                                    // in this message we are saving the ThreadMessageModel and inside ThreadmessageModel we will pass the data like id, and other data.
                                    final message = ThreadMessageModel(
                                        id: messageData['id'],
                                        senderName: messageData['sender'],
                                        senderProfileImageUrl:
                                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfu_FJRE1WJWfk1jTiEYgUdRxGYwSnD7NB-g&s',
                                        message: messageData['thread'],
                                        timeStamp: timeStamps);
                                    return ThreadMessageWidget(
                                      // Now to ThreadMessageWidget which required ModelData so we pass the Variable message which contains the Model Data
                                
                                      messageModel: message,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        })
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
