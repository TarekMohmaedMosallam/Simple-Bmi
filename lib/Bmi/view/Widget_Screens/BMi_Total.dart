import 'package:bmi/Bmi/view/Widget_Screens/Bmi_Work_Branch.dart';
import 'package:flutter/material.dart';

class BmiTotal extends StatefulWidget {
  const BmiTotal({
    super.key,
    required this.bmi,
  });
  final double bmi;

  @override
  State<BmiTotal> createState() => _BmiTotalState();
}

class _BmiTotalState extends State<BmiTotal> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('BMI Total'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20), // Replace `spacing`
              Text(
                'Your BMI is: ${widget.bmi.toStringAsFixed(0)}',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20), // Replace `spacing`
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => BmiWorkBranch()));
                },
                child: const Text('Back'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
