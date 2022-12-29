import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hbeep/component/row_dropdownbutton.dart';
import 'package:flutter/services.dart';
import '../component/my_text_Field.dart';
import '../dropdown_list.dart';
import '../utils/predition_request.dart';
import 'package:http/http.dart' as http;

class PredictionPage extends StatefulWidget {
  @override
  State<PredictionPage> createState() => _PredictionPageState();
}

class _PredictionPageState extends State<PredictionPage> {
  final _formKey = GlobalKey<FormState>();

  int? gender;

  double? age;

  int? heartDisease;

  int? married_satus;

  int? work_status;

  int? residence;

  double? glucose_level;

  int? smoke;

  int? stroke;

  double? bmi;

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
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
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                          title: 'Gender',
                          itemList: genderlist,
                          callback: (value) => gender = value - 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: MyTextField(
                          Title: 'Age',
                          HintTitle: '23...',
                          keyboardType: TextInputType.number,
                          onChanged: (value) => age = double.parse(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'Do you have any heart disease',
                            itemList: yes_no,
                            callback: (value) => heartDisease = value - 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: MyTextField(
                          Title: 'Bmi',
                          HintTitle: '23.4...',
                          keyboardType: TextInputType.number,
                          onChanged: (value) => bmi = double.parse(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'are u married',
                            itemList: yes_no,
                            callback: (value) => married_satus = value - 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'Work status',
                            itemList: work_type,
                            callback: (value) => work_status = value - 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'Residence',
                            itemList: residence_type,
                            callback: (value) => residence = value - 1),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: MyTextField(
                          Title: 'Glucose Level',
                          HintTitle: '125.20...',
                          keyboardType: TextInputType.number,
                          onChanged: (value) =>
                              glucose_level = double.parse(value),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'Do u Smoke',
                            itemList: smoking_status,
                            callback: (value) => smoke = value - 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: RowDropdownButton(
                            title: 'Do u have stroke',
                            itemList: yes_no,
                            callback: (value) => stroke = value - 1),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: OutlinedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                _isLoading = true;
                              });
                              try {
                                await fetchData(
                                        gender: gender!,
                                        age: age!,
                                        heartDisease: heartDisease!,
                                        married_status: married_satus!,
                                        work_status: work_status!,
                                        residence: residence!,
                                        glucose_level: glucose_level!,
                                        bmi: bmi!,
                                        smoke: smoke!,
                                        stroke: stroke!)
                                    .then(
                                  (value) {
                                    setState(() {
                                      _isLoading = false;
                                    });
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return MyDiaog(context, value.body);
                                      },
                                    );
                                  },
                                ).onError((error, stackTrace){
                                  setState(() {
                                    _isLoading = false;
                                  });
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text('Check your network')));
                                  print("Error: ${error}");
                                });
                              } on http.ClientException catch (e) {
                                setState(() {
                                  _isLoading = false;
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Check your network')));
                                print("Error: ${e}");
                              }
                            }
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
        ),
        if (_isLoading)
          const Opacity(
            opacity: 0.8,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black12,
            ),
          ),
        if (_isLoading)
          const Center(
            child: CircularProgressIndicator(),
          )
      ],
    );
  }

  SimpleDialog MyDiaog(BuildContext context, String Title) {
    return SimpleDialog(
      // alignment: Alignment.center,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: SvgPicture.asset('assets/icons/report_icon.svg'),
          ),
          Text('Result')
        ],
      ),
      children: [
        Align(
          child: Text(
            Title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
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
  }
}
