// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

/* In this class we create parameters for Required things for showing user post 
    so we need Id, Sendername like this. Then we create constructors with the help of 
    extension which is DartDataClassGenerator and similarly we use this class to get
    JSON Serialization. 

    ***Purpose of this Model Class is: this ThreadMessageModel class acts as a blueprint for representing 
    message data in a Flutter app. It provides a structured way to store and manage message information, and 
    the JSON serialization methods allow for easy data exchange between the app and external APIs.
    */
class ThreadMessageModel {
  final String id;
  final String senderName;
  final String senderProfileImageUrl;
  final String message;
  final DateTime timeStamp;
  final int likesCount;
  final int retweetCount;
  final int commentsCount;

  ThreadMessageModel(
      {required this.id,
      required this.senderName,
      required this.senderProfileImageUrl,
      required this.message,
      required this.timeStamp,
      required this.likesCount,
      required this.retweetCount,
      required this.commentsCount});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'senderName': senderName,
      'senderProfileImageUrl': senderProfileImageUrl,
      'message': message,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'likesCount': likesCount,
      'retweetCount': retweetCount,
      'commentsCount': commentsCount,
    };
  }

  factory ThreadMessageModel.fromMap(Map<String, dynamic> map) {
    return ThreadMessageModel(
      id: map['id'] as String,
      senderName: ['senderName'] as String,
      senderProfileImageUrl: map['senderProfileImageUrl'] as String,
      message: ['message'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      likesCount: ['likesCount'] as int,
      retweetCount: map['retweetCount'] as int,
      commentsCount: map['commentsCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ThreadMessageModel.fromJson(String source) =>
      ThreadMessageModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

List<ThreadMessageModel> threadmessagesList = [
  ThreadMessageModel(
      id: "1",
      senderName: "John",
      senderProfileImageUrl: "https://drive.propcon.co.za/user/20200721/faa636326646859a83818b25e0a5639b/20240621095813.jpg",
      message: "Hey This is a new App",
      // timestamp means the post was posted 30 minutes ago according to current time so we subtract the post time from actual time to get the exact post time

      timeStamp: DateTime.now().subtract(Duration(minutes: 30)),
      likesCount: 12,
      retweetCount: 2,
      commentsCount: 4),
       ThreadMessageModel(
      id: "2",
      senderName: "Zota",
      senderProfileImageUrl: "https://media.istockphoto.com/id/1682296067/nl/foto/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=hRLk6UbWfFB50q07f69Iqj7Ld65EKLtI4dSQVgKkzDw=",
      message: "Welcome to my ID Guyz",
      timeStamp: DateTime.now().subtract(Duration(minutes: 10)),
      likesCount: 1223,
      retweetCount: 223,
      commentsCount: 413),
       ThreadMessageModel(
      id: "3",
      senderName: "Saikl",
      senderProfileImageUrl: "https://media.istockphoto.com/id/1368363766/photo/portrait-of-young-men-stock-photo.jpg?s=612x612&w=0&k=20&c=WMqbUvJrTYysFEjUhdAIeSiDcGxdd9oP--6x9RfIKfs=",
      message: "How much money is required for small Business",
      timeStamp: DateTime.now().subtract(Duration(minutes: 60)),
      likesCount: 122,
      retweetCount: 213,
      commentsCount: 41),

];

