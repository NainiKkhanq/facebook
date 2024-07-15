import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class SuggestedFollowersModel {
  final String Id;
  final String UserName;
  final String ProfileImageUrl;
  final bool isfollowing;
  SuggestedFollowersModel({
    required this.Id,
    required this.UserName,
    required this.ProfileImageUrl,
    required this.isfollowing,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'Id': Id,
      'UserName': UserName,
      'ProfileImageUrl': ProfileImageUrl,
      'isfollowing': isfollowing,
    };
  }

  factory SuggestedFollowersModel.fromMap(Map<String, dynamic> map) {
    return SuggestedFollowersModel(
      Id: map['Id'] as String,
      UserName: map['UserName'] as String,
      ProfileImageUrl: map['ProfileImageUrl'] as String,
      isfollowing: map['isfollowing'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuggestedFollowersModel.fromJson(String source) =>
      SuggestedFollowersModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

List<SuggestedFollowersModel> suggested_followersModelList = [
  SuggestedFollowersModel(
      Id: "12",
      UserName: "Ethop",
      ProfileImageUrl: "https://media.istockphoto.com/id/1682296067/nl/foto/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=hRLk6UbWfFB50q07f69Iqj7Ld65EKLtI4dSQVgKkzDw=",
      isfollowing: true),
       SuggestedFollowersModel(
      Id: "12",
      UserName: "Justin",
      ProfileImageUrl: "https://media.istockphoto.com/id/1682296067/nl/foto/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=hRLk6UbWfFB50q07f69Iqj7Ld65EKLtI4dSQVgKkzDw=",
      isfollowing: false),
       SuggestedFollowersModel(
      Id: "12",
      UserName: "Toklp",
      ProfileImageUrl: "https://media.istockphoto.com/id/1682296067/nl/foto/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=hRLk6UbWfFB50q07f69Iqj7Ld65EKLtI4dSQVgKkzDw=",
      isfollowing: true),
       SuggestedFollowersModel(
      Id: "12",
      UserName: "Poelo",
      ProfileImageUrl: "https://media.istockphoto.com/id/1682296067/nl/foto/happy-studio-portrait-or-professional-man-real-estate-agent-or-asian-businessman-smile-for.jpg?s=612x612&w=0&k=20&c=hRLk6UbWfFB50q07f69Iqj7Ld65EKLtI4dSQVgKkzDw=",
      isfollowing: false)
];
