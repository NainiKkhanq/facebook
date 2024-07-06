import 'package:flutter/material.dart';

class TextFields extends StatelessWidget {
  String hintText;
  TextEditingController controllers;
   TextFields({super.key,required this.hintText,required this.controllers});

  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TextFormField(
            controller: controllers,
            decoration:  InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              ),
              focusedBorder:  const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)
              ),
              hintText: "$hintText"
            ),
          ),
        );
  }
}