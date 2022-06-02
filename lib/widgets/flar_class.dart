
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
class MenuItem {
  late final int id;

  final String name;
  final Color color;
  final double x;
  MenuItem({required this.name, required this.color, required this.x,required this.id});
}

class NavBar extends StatefulWidget {
  createState() => NavBarState();
}

class NavBarState extends State<NavBar> {
  List items = [
    MenuItem(x: -1.0, name: 'house', color: const Color.fromRGBO(178, 228, 250, 1),id: 0),
    MenuItem(x: -0.5, name: 'planet', color: Colors.purple,id: 1),
    MenuItem(x: 0.0, name: 'camera', color: Colors.greenAccent,id: 2),
    MenuItem(x: 0.5, name: 'heart', color: Colors.pink,id: 3),
    MenuItem(x: 1.0, name: 'head', color: Colors.yellow,id: 4),
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
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight:Radius.circular(15) ),
        color: Colors.black87,

      ),
      height: 75,
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
          AnimatedContainer(
            duration: Duration(milliseconds: 200),
            alignment: Alignment(active!.x, 1),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 1000),
              height: 16,
              width: w * 0.21,
              child:  Center(child: Text(active!.name,
                style: TextStyle(color: active!.color,fontWeight: FontWeight.bold,fontSize: 15),)),
            ),
          ),



        ],
      ),
    );
  }

  Widget _flare(MenuItem item) {
    return GestureDetector(
      child: AspectRatio(
        aspectRatio: 0.8,
        child: Padding(
          padding: EdgeInsets.only(top: 12),
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
          active!.id=item.id;
        });
      },
    );
  }
}