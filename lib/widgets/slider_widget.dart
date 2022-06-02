import 'package:flutter/material.dart';

class buildSlider extends StatefulWidget {
  const buildSlider({Key? key}) : super(key: key);

  @override
  _buildSliderState createState() => _buildSliderState();
}

class _buildSliderState extends State<buildSlider> {
  double _value=0.0;
  @override
  Widget build(BuildContext context) {
    return Slider(
        activeColor: Colors.blueGrey,
        inactiveColor: Colors.black26,
        label: _value.round().toString(),
        min: 0,
        max: 100,
        divisions: 100,
        value: _value,
        onChanged: (double val) {
          setState(() {
            _value = val;
          });
        });
  }
}
