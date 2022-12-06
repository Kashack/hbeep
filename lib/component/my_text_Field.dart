import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String Title;
  String HintTitle;
  Function(String)? onChanged;

  MyTextField({required this.Title, required this.HintTitle, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(Title)),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              enabledBorder:  OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFF002E94),)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Color(0xFF002E94),)
              ),
              hintText: HintTitle,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),

            ),
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}