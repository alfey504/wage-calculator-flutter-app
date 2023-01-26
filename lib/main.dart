import 'package:flutter/material.dart';
import 'package:wage_calculator/utils/wage.dart';
import 'package:wage_calculator/widgets/form_element.dart';
import 'package:wage_calculator/widgets/output_element.dart';

void main() => runApp(const MaterialApp(
      home: Home(),
    ));

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromRGBO(30, 30, 30, 1.0),
        body: Form(),
      ),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _FormState();
}

class _FormState extends State<Form> {
  String wagePerHour = "0.0";
  String hours = "0.0";
  double basePay = 0.0;
  double overtimePay = 0.0;
  double totalWage = 0.0;

  Wage wage = Wage();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
      padding: const EdgeInsets.all(10.0),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.start, children: <Widget>[
        FormElement(
          label: "WAGE/HOUR",
          value: wagePerHour,
          setValue: (String value) {
            setState(() {
              wagePerHour = value;
            });
          },
        ),
        const SizedBox(height: 20.0),
        FormElement(
          label: "HOURS",
          value: hours,
          setValue: (String value) {
            setState(() {
              hours = value;
            });
          },
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              backgroundColor: const Color.fromRGBO(254, 102, 148, 1.0)),
          onPressed: () {
            if (wagePerHour != "" && hours != "") {
              setState(() {
                wage.setWage(wagePerHour, hours);
              });
            }
          },
          child: const Text(
            "CALCULATE",
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
        ),
        const SizedBox(height: 20.0),
        OutputElement(label: 'WAGE', value: wage.basePay.toString()),
        const SizedBox(height: 20.0),
        OutputElement(label: 'OVERTIME', value: wage.overtimePay.toString()),
        const SizedBox(height: 20.0),
        OutputElement(label: 'TOTAL', value: wage.totalPay.toString()),
        const SizedBox(height: 20.0),
        OutputElement(label: 'TAX', value: wage.tax.toString())
      ]),
    );
  }
}
