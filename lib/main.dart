import 'package:flutter/material.dart';
import 'package:gender_selector/gender_selector.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _age = TextEditingController();
  final TextEditingController _height = TextEditingController();
  final TextEditingController _weight = TextEditingController();

  double a = 0.0, b = 0.0, result = 0.0;
  int c = 0;
  String bmr, selectedGender;

  get gender => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basal Metabolic Rate Calculator',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text('Basal Metabolic Rate Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Text(
                'Choose your gender',
                textDirection: TextDirection.ltr,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.black87,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
              child: GenderSelector(
                margin: EdgeInsets.only(
                  left: 10,
                  top: 30,
                  right: 10,
                  bottom: 10,
                ),
                onChanged: (gender) {
                  print(gender);
                  setState(() {
                    if (gender == Gender.FEMALE) {
                      selectedGender = "female";
                    } else if (gender == Gender.MALE) {
                      selectedGender = "male";
                    }
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 19,
                ),
                decoration: InputDecoration(
                  hintText: "Age",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _age,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 19,
                ),
                decoration: InputDecoration(
                  hintText: "Height (cm)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _height,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
              child: TextField(
                style: TextStyle(
                  fontSize: 19,
                ),
                decoration: InputDecoration(
                  hintText: "Weight (kg)",
                ),
                keyboardType: TextInputType.numberWithOptions(),
                controller: _weight,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                onPressed: _onPress,
              ),
            ),
            Text(
              "BMR: $bmr",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onPress() {
    setState(() {
      a = double.parse(_height.text);
      b = double.parse(_weight.text);
      c = int.parse(_age.text);

      if (selectedGender == "male") {
        result = (10 * b) + (6.25 * a) - (5 * c) + 5;
      } else {
        result = (10 * b) + (6.25 * a) - (5 * c) - 161;
      }
      bmr = format(result);
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }
}
