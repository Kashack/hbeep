import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbeep/component/row_dropdownbutton.dart';

import '../component/my_text_Field.dart';
import '../dropdown_list.dart';

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
      // appBar: AppBar(
      //   title: Text(
      //     'Prediction',
      //     style: TextStyle(
      //       color: Colors.white
      //     )
      //   ),
      // ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Predict Your Blood Preassure',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
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
                    child: MyTextField(
                      Title: 'Age',
                      HintTitle: '23...',
                      onChanged: (value) {},
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
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: MyTextField(
                      Title: 'Bmi',
                      HintTitle: '23.4...',
                      onChanged: (value) {},
                    ),
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
                        // if (_formKey.currentState!.validate()) {
                        //   print(gender);
                        //   print(married_satus);
                        //   print(smoke);
                        //
                        // }
                        showDialog(
                          context: context,
                          builder: (context) {
                            return SimpleDialog(
                              // alignment: Alignment.center,
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: SvgPicture.asset(
                                        'assets/icons/report_icon.svg'),
                                  ),
                                  Text('Result')
                                ],
                              ),
                              children: [
                                Align(
                                  child: Text('Low Blood pressure',style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold
                                  ),),
                                  alignment: Alignment.center,
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Close',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    style: TextButton.styleFrom(
                                      elevation: 2,
                                      backgroundColor: Color(0xFF002E94),
                                    ),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 60),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: Text('Predict',
                          style: TextStyle(color: Colors.white)),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Color(0xFF002E94),
                          padding: EdgeInsets.all(15),
                          minimumSize: Size(double.infinity, 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
