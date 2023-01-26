import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wage_calculator/utils/wage.dart';

class FormElement extends StatelessWidget {
  final String label;
  final String value;
  final Function setValue;

  const FormElement(
      {super.key,
      required this.label,
      required this.value,
      required this.setValue});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Color.fromRGBO(20, 20, 20, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Color.fromRGBO(254, 102, 148, 1.0),
              ),
            ),
            const SizedBox(height: 0.0),
            TextField(
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: <TextInputFormatter>[
                TextInputFormatter.withFunction(
                  (TextEditingValue oldValue, TextEditingValue newValue) {
                    return Wage.isNumber(newValue.text) ? newValue : oldValue;
                  },
                ),
              ],
              onChanged: (value) => setValue(value),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: label,
                hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 30.0),
            )
          ]),
    );
  }
}
