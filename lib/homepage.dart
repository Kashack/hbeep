import 'package:flutter/material.dart';
import 'package:hbeep/component/row_dropdownbutton.dart';

import 'dropdown_list.dart';

class PredictionPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  int? gender;
  int? age;
  int? heartDisease;
  int? married_satus;
  int? work_status;
  int? residence;
  int? glucose_level;
  int? smoke;
  int? stroke;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prediction'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                    title: 'Gender',
                    itemList: genderlist,
                    callback: (value) => gender = value,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text('Age', style: TextStyle(color: Colors.black)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Do you have any heart disease',
                      itemList: yes_no,
                      callback: (value) => heartDisease = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'are u married',
                      itemList: yes_no,
                      callback: (value) => married_satus = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Work status',
                      itemList: work_type,
                      callback: (value) => work_status = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Residence',
                      itemList: residence_type,
                      callback: (value) => residence = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Glucose level',
                      itemList: glucose_levels,
                      callback: (value) => glucose_level = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Do u Smoke',
                      itemList: smoking_status,
                      callback: (value) => smoke = value),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RowDropdownButton(
                      title: 'Do u have stroke',
                      itemList: yes_no,
                      callback: (value) => stroke = value),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        print(gender);
                        print(married_satus);
                        print(smoke);
                      }
                    },
                    child:
                        Text('Predict', style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.yellow,
                        padding: EdgeInsets.all(15),
                        minimumSize: Size(double.infinity, 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
