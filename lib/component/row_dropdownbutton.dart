import 'package:flutter/material.dart';

class RowDropdownButton extends StatefulWidget {

  List itemList;
  String title;
  Function callback;
  RowDropdownButton({ required this.itemList, required this.title, required this.callback});

  @override
  State<RowDropdownButton> createState() => _RowDropdownButtonState();
}

class _RowDropdownButtonState extends State<RowDropdownButton> {
  var dropdownValue;
  @override
  void initState() {
    dropdownValue = widget.itemList.indexOf(widget.itemList.first);
  }
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (value) {
        if(value == 0){
          return 'Please select a value';
        }
      },
      decoration: InputDecoration(
        label: Text(widget.title,style: TextStyle(color: Colors.black)),
        border: OutlineInputBorder(),
        enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.yellow)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.yellow)
        )
      ),
      value: dropdownValue,
      items: widget.itemList.map((value) {
        return DropdownMenuItem(
          child: Text(value),
          value: widget.itemList.indexOf(value),
        );
      }).toList(),
      onChanged: (value) {
        setState(() {
          dropdownValue = value;
          widget.callback(value);
        });
      },
    );
  }
}