import 'package:flutter/material.dart';


AppBar buildAppBar() {
  return AppBar(
    leading: Padding(
      padding: const EdgeInsets.only(left: 1),
      child: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.account_balance,
        ),
      ),
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.blueGrey, Colors.black12])),
    ),
    title: const Text(
      'Test App',
      style: TextStyle(
          fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
    ),
    centerTitle: true,
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.account_balance,
        ),
      ),
    ],
  );
}
