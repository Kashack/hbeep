import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hbeep/component/my_text_Field.dart';

class BMIPage extends StatefulWidget {
  @override
  State<BMIPage> createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _formKey = GlobalKey<FormState>();

  bool isVisible = false;

  double? height;

  double? weight;

  String calculate ="";

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
                    keyboardType: TextInputType.number,
                    onChanged: (value) {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    Title: 'Weight',
                    HintTitle: 'In Kg',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => weight = double.parse(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: MyTextField(
                    Title: 'Height',
                    keyboardType: TextInputType.number,
                    HintTitle: 'In cm',
                    onChanged: (value) => height = double.parse(value),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        FocusScope.of(context).unfocus();
                        height = height! * height! /1000;
                        calculate = (weight! / height!).toStringAsFixed(2);
                        setState(() {
                          isVisible = true;
                        });
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
                        child:
                            Text('Your Body Mass Index (BMI) :'),
                      ),
                      Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Color(0xFF002E94),
                        ),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 40),
                        margin:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () async {
                                await Clipboard.setData(ClipboardData(text: calculate.toString()));
                              },
                              icon: Icon(Icons.paste,color: Colors.white),
                            ),
                            Text(
                              calculate,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.white),
                            ),
                          ],
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
