import 'package:flutter/material.dart';

class buildRadioListTileContainer extends StatefulWidget {
  const buildRadioListTileContainer({Key? key}) : super(key: key);

  @override
  _buildRadioListTileContainerState createState() => _buildRadioListTileContainerState();
}

class _buildRadioListTileContainerState extends State<buildRadioListTileContainer> {
  var radioValue = 0;
  RadioListTile<int> buildRadioListTile(val, String txt, String subTxt) {
    return RadioListTile(
      value: val,
      groupValue: radioValue,
      onChanged: (value) {
        setState(() {
          radioValue = value as int;
        });
      },
      title: Text('$txt'),
      subtitle: Text("$subTxt"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: radioValue == 0 ? Colors.red : Colors.green,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          buildRadioListTile(0, "Red", "Changed to Red"),
          buildRadioListTile(1, "Green", "Changed to Green"),
        ],
      ),
    );
  }
}
