import 'package:details_of_widget_flutter/widgets/show_snakbar.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';

class CircleFloating extends StatefulWidget {
  GlobalKey<FabCircularMenuState> fabKey;
   CircleFloating(this.fabKey);

  @override
  _CircleFloatingState createState() => _CircleFloatingState();
}

class _CircleFloatingState extends State<CircleFloating> {

  @override
  Widget build(BuildContext context) {
    return FabCircularMenu(
      key: widget.fabKey,
      // Cannot be `Alignment.center`
      alignment: Alignment.bottomRight,
      ringColor: Colors.blue.withAlpha(50),
      ringDiameter: 500.0,
      ringWidth: 150.0,
      fabSize: 64.0,
      fabElevation: 8.0,
      fabIconBorder: const CircleBorder(),
      // Also can use specific color based on wether
      // the menu is open or not:
      // fabOpenColor: Colors.white
      // fabCloseColor: Colors.white
      // These properties take precedence over fabColor
      fabColor: Colors.blue,
      fabOpenIcon: const Icon(Icons.menu, color: Colors.black),
      fabCloseIcon: const Icon(Icons.close, color: Colors.black),
      fabMargin: const EdgeInsets.all(16.0),
      animationDuration: const Duration(milliseconds: 800),
      animationCurve: Curves.easeInOutCirc,
      // onDisplayChange: (isOpen) {
      //   _showSnackBar(context, "The menu is ${isOpen ? "open" : "closed"}");
      // },
      children: <Widget>[
        RawMaterialButton(
          onPressed: () {
            showSnackBar(context, "You pressed 1");
          },
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: const Icon(Icons.looks_one, color: Colors.black),
        ),
        RawMaterialButton(
          onPressed: () {
            showSnackBar(context, "You pressed 2");
          },
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: const Icon(Icons.looks_two, color: Colors.black),
        ),
        RawMaterialButton(
          onPressed: () {
            showSnackBar(context, "You pressed 3");
          },
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: const Icon(Icons.looks_3, color: Colors.black),
        ),
        RawMaterialButton(
          onPressed: () {
            showSnackBar(context, "You pressed 4. This one closes the menu on tap");
            widget.fabKey.currentState!.close();
          },
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(24.0),
          child: const Icon(Icons.looks_4, color: Colors.black),
        )
      ],
    );
  }
}


