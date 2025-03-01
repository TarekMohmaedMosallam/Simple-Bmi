import 'package:bmi/Bmi/model/Values/Values.dart';
import 'package:bmi/Bmi/view/Resuable_Widget/Gender_Selection.dart';
import 'package:bmi/Bmi/view/Resuable_Widget/Musurement.dart';
import 'package:bmi/Bmi/view/Widget_Screens/BMi_Total.dart';
import 'package:bmi/Bmi/view/Widget_Screens/Calculate_Button.dart';
import 'package:bmi/Bmi/view/Widget_Screens/Hight.dart';
import 'package:bmi/Bmi/view_models/Calcutate_Bmi.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class BmiWorkBranch extends StatefulWidget {
  const BmiWorkBranch({super.key});

  @override
  State<BmiWorkBranch> createState() => _BmiWorkBranchState();
}

class _BmiWorkBranchState extends State<BmiWorkBranch> {
  double weight = 0;
  int age = 0;
  int _gender = 0;
  int height = 150;
  bool isFinished = false;
  double bmi = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('BMI Work Branch'),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 300,
              height: 100,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GenderSelection(
                    gender: male, // Replace with appropriate variable
                    genderText: 'Male',
                    onSelected: () {
                      setState(() {
                        _gender = 1;
                      });
                    },
                    onUnSelected: () {},
                    genderSelected: _gender == 1,
                  ),
                  const SizedBox(width: 20),
                  GenderSelection(
                    gender: female, // Replace with appropriate variable
                    genderText: 'Female',
                    onSelected: () {
                      setState(() {
                        _gender = 2;
                      });
                    },
                    onUnSelected: () {},
                    genderSelected: _gender == 2,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Hight(hight: height),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                Center(
                  child: Measurement(
                    weight: weight,
                    text: "Weight (Kg)",
                    onWeightChanged: (newWeight) {
                      setState(() {
                        weight = newWeight;
                      });
                    },
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
            const SizedBox(height: 20),
            CalculateButton(
              text: "Calculate",
              function: () {
                setState(() {
                  bmi = CalcutateBmi.calculateBmi(weight, height.toDouble());
                  isFinished = true;
                });

                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: BmiTotal(
                      bmi: bmi,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
