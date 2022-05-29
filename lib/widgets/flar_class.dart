
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class MenuItem {
  final String name;
  final Color color;
  final double x;
  MenuItem({required this.name, required this.color, required this.x});
}

class NavBar extends StatefulWidget {
  createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  List items = [
    MenuItem(x: -1.0, name: 'house', color: const Color.fromRGBO(178, 228, 250, 1)),
    MenuItem(x: -0.5, name: 'planet', color: Colors.purple),
    MenuItem(x: 0.0, name: 'camera', color: Colors.greenAccent),
    MenuItem(x: 0.5, name: 'heart', color: Colors.pink),
    MenuItem(x: 1.0, name: 'head', color: Colors.yellow),
  ];

  MenuItem? active;

  @override
  void initState() {
    super.initState();

    active = items[0];
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      height: 60,
      color: Colors.black,
      child: Stack(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active!.x, -1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 5,
              width: w * 0.2,
              color: active!.color,
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: items.map((k) {
                return _flare(k);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 1,
        child: Padding(
          padding: EdgeInsets.only(top: 10),
          child: FlareActor(
            'assets/${item.name}.flr',

            alignment: Alignment.topCenter,
            fit: BoxFit.contain,
            animation: item.name == active!.name ? 'go' : 'idle',
          ),
        ),
      ),
      onTap: () {
        setState(() {
          active = item;
        });
      },
    );
  }
}