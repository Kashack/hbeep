import 'package:flutter/material.dart';
import 'package:hbeep/component/my_text_Field.dart';
import 'package:hbeep/component/row_dropdownbutton.dart';

class BMIPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Calculate your Body Mass Index',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    Title: 'Age',
                    HintTitle: '23..',
                    onChanged: (p0) { },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    Title: 'Weight',
                    HintTitle: 'In Kg',
                    onChanged: (p0) { },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    Title: 'Height',
                    HintTitle: 'In feet',
                    onChanged: (p0) { },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // print(gender);
                        // print(married_satus);
                        // print(smoke);
                      }
                    },
                    child: Text('Calculate',
                        style: TextStyle(color: Colors.white)),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Color(0xFF002E94),
                        padding: EdgeInsets.all(15),
                        minimumSize: Size(double.infinity, 20)),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Your Body Mass Index (BMI) :'),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF002E94),
                        ),
                        padding: EdgeInsets.symmetric(vertical: 16,horizontal: 40),
                        margin: EdgeInsets.symmetric(vertical: 16,horizontal: 16),
                        child: Text(
                          '22.3',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.white
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
