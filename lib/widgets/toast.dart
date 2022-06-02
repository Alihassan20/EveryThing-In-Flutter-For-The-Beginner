import 'package:flutter/material.dart';

ElevatedButton buildToast() {
  return ElevatedButton(
    onPressed: () {
      // Fluttertoast.showToast(
      //     msg: "Ali hassan",
      //     backgroundColor: Colors.black54,
      //     textColor: Colors.white);
    },
    child: const Text("Toast"),
  );
}
