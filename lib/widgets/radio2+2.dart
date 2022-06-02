import 'package:flutter/material.dart';

class buildRadioWithDialog extends StatefulWidget {
  const buildRadioWithDialog({Key? key}) : super(key: key);

  @override
  _buildRadioWithDialogState createState() => _buildRadioWithDialogState();
}

class _buildRadioWithDialogState extends State<buildRadioWithDialog> {

  int radioValue2 = 0;
  String  result = '';
  Color resultColor = Colors.yellow;

  Row buildRadio1(int value) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: radioValue2,
            onChanged: (val) {
              setState(() {
                radioValue2 = val as int;
                result = value == 4 ? "Correct Answer 👏" : "Wrong Answer 👎";
                resultColor = value == 4 ? Colors.black : Colors.red;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(result.toString(),style: TextStyle(color: resultColor),),
                  ),
                );
              });
            }),
        Text("$value"),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            ' Guess The Answer :   2+2 = ? \n',
            style:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          buildRadio1(3),
          buildRadio1(4),
          buildRadio1(5),
        ],
      ),
    );
  }
}


