import 'package:flutter/material.dart';

class CalculateButton extends StatelessWidget {
  const CalculateButton(
      {super.key, required this.text, required this.function});
  final String text;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 70),
        child: ElevatedButton(
          onPressed: function,
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all<Size>(Size(200, 50)),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.white60),
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 16, 15, 15),
            ),
          ),
        ));
  }
}
