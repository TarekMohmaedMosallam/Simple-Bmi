import 'package:bmi/Bmi/view/Styles/Choice3d_Style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection(
      {super.key, required this.gender, required this.genderText, required this.onSelected, required this.onUnSelected,required this.genderSelected});
  final String gender;
  final String genderText;
  final VoidCallback onSelected;
  final VoidCallback onUnSelected;
  final bool genderSelected ;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    
    return Row(
      children: [
        ChoiceChip3D(
          border:Border.all(color: Colors.grey), 
          style:Choice3dStyles.choiceChip3DStyle() ,
            onSelected: widget.onSelected,
            onUnSelected: widget.onUnSelected,
            selected:widget.genderSelected ,
            child: Column(
              children: [
                Image(
                  image: AssetImage(widget.gender),
                  width: 50,
                ),
                Text(widget.genderText)
              ],
            ))
      ],
    );
  }
}
