import 'package:flutter/material.dart';

class OutputElement extends StatelessWidget {
  final String label;
  final String value;

  const OutputElement({
    super.key,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 285.0,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(254, 220, 219, 1.0),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              label,
              style: const TextStyle(
                color: Color.fromRGBO(254, 102, 148, 1.0),
              ),
            ),
            const SizedBox(height: 10.0),
            Expanded(
                flex: 1,
                child: Text(
                  value,
                  style: const TextStyle(fontSize: 32.0),
                ))
          ]),
    );
  }
}
