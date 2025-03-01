import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Hight extends StatefulWidget {
   Hight({super.key,required this.hight});
 int hight ;

  @override
  State<Hight> createState() => _HightState();
}

class _HightState extends State<Hight> {
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      shape: const RoundedRectangleBorder(),
      child: Column(
        children: [
          const Text(
            'Hight',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.hight.toString(),
                style: TextStyle(fontSize: 40, color: Colors.grey),
              ),
              Text(
                "cm",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ],
          ),
          Slider(
            value: widget.hight.toDouble(),
            min: 0,
            max: 250,
            thumbColor: Colors.red,
            onChanged: (value) {
              setState(() {
                widget.hight = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}
