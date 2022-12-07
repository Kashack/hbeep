import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  String Title;
  String HintTitle;
  Function(String)? onChanged;
  TextInputType? keyboardType;

  MyTextField({required this.Title, required this.HintTitle, required this.onChanged,this.keyboardType});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(Title)),
        Expanded(
          child: TextFormField(
            validator: (value) {
              if(value == ""){
                return 'Enter a value';
              }
            },
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
            keyboardType: keyboardType,
            onChanged: onChanged,
          ),
        ),
      ],
    );
  }
}