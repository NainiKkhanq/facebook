import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class EditProfile extends StatefulWidget {
  PanelController panelController = PanelController();
   EditProfile({super.key,required this.panelController});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                      onPressed: () {widget.panelController.close();},
                      child: const Text(
                        "Close",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  const Text(
                    "Edit Profile",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      // Called the Thread Posting Message this will send the Thread to the Firestore
                      onPressed: () {},
                      child: const Text(
                        "Save",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      )),
                ],
              ),
              const Divider(
                thickness: 1.0,
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: double.infinity,
                  height: 340,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: Row(
                          children: [
                            const Text("Name"),
                            const SizedBox(
                              width: 5,
                            ),
                            InkWell(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "User Name is not Writeable")));
                                },
                                child: const Icon(
                                  Icons.lock,
                                  size: 15,
                                ))
                          ],
                        ),
                        subtitle: const Text("userName"),
                        trailing: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQfu_FJRE1WJWfk1jTiEYgUdRxGYwSnD7NB-g&s"),
                        ),
                      ),
                      const Divider(),
                      ListTile(
                          title: const Text("Bio"),
                          subtitle: TextFormField(
                            autocorrect: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Bio Needs to be there',
                                hintStyle: TextStyle(fontSize: 14)),
                          )),
                      const Divider(),
                      ListTile(
                          title: const Text("Link"),
                          subtitle: TextFormField(
                            autocorrect: true,
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Business Link',
                                hintStyle: TextStyle(fontSize: 14)),
                          )),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Private Account"),
                            Switch(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  isChecked = value;
                                });
                              },
                              activeColor: Colors.black,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ))
            ])));
  }
}
