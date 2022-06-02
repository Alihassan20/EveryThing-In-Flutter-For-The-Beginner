import 'dart:math';

import 'package:flutter/material.dart';
Transform buildTransform(_value) {
  return Transform.rotate(
    angle: _value * (pi / 180),
    child: Container(
      height: _value,
      width: _value,
      color: Colors.black,
    ),
  );
}