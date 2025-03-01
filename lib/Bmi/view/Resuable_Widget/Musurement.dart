import 'package:flutter/material.dart';

class Measurement extends StatefulWidget {
  const Measurement({
    super.key,
    required this.weight,
    required this.text,
    required this.onWeightChanged,
  });

  final double weight;
  final String text;
  final ValueChanged<double> onWeightChanged;

  @override
  State<Measurement> createState() => _MeasurementState();
}

class _MeasurementState extends State<Measurement> {
  late double weight;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    weight = widget.weight;
    weight = 0;
    _controller = TextEditingController(
      text: widget.weight > 0 ? widget.weight.toString() : '',
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 110,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            onChanged: (value) {
              if (value.isNotEmpty) {
                widget.onWeightChanged(double.tryParse(value) ?? weight);
              }
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: widget.text,
            ),
          ),
        ],
      ),
    );
  }
}
