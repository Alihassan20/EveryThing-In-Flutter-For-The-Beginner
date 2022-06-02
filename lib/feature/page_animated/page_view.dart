import 'package:flutter/material.dart';

class Page_Animated extends StatefulWidget {
  const Page_Animated({Key? key}) : super(key: key);

  @override
  _Page_AnimatedState createState() => _Page_AnimatedState();
}

class _Page_AnimatedState extends State<Page_Animated> {
  bool active =true ;

  PageController controller = PageController(viewportFraction: 0.8);

  int _curr = 0;
  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      int next = controller.page!.round();
      if(_curr!=next){
        setState(() {
          _curr = next;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      AnimatedContainer(duration: const Duration(milliseconds: 200),
        curve:Curves.easeInCirc,
        margin:  EdgeInsets.only(top: active?100:200,bottom: 50,right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: NetworkImage("https://cdn.vox-cdn.com/thumbor/1iK--pH6ifK7oLhOHVk-WALTGV0=/0x114:2397x2363/920x613/filters:focal(827x236:1393x802):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70543735/1238713176.0.jpg"),      fit: BoxFit.cover
            ),
            boxShadow:  [BoxShadow(color: Colors.black87,blurRadius: active ? 30:0,offset: Offset(active?20:0,active?20:0))]
        ),
      ),
      AnimatedContainer(duration: const Duration(milliseconds: 200),
        curve:Curves.easeInCirc,
        margin:  EdgeInsets.only(top: !active?100:200,bottom: 50,right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(

                image: NetworkImage('https://static.independent.co.uk/2021/08/17/18/newFile-3.jpg?quality=75&width=990&auto=webp&crop=982:726,smart'),            fit: BoxFit.cover
            ),
            boxShadow:  [BoxShadow(color: Colors.black87,blurRadius: !active ? 30:0,offset: Offset(!active?20:0,!active?20:0))]
        ),
      ),
      AnimatedContainer(duration: const Duration(milliseconds: 200),
        curve:Curves.easeInCirc,
        margin:  EdgeInsets.only(top: active?100:200,bottom: 50,right: 30),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
                image: NetworkImage("https://cdn.vox-cdn.com/thumbor/lEk-dxnrq3MXR7KIMlR4A8I_seU=/0x0:3734x2538/920x613/filters:focal(1521x440:2117x1036):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/70603033/1372404766.0.jpg"
                ),            fit: BoxFit.cover
            ),
            boxShadow:  [BoxShadow(color: Colors.black87,blurRadius: active ? 30:0,offset: Offset(active?20:0,active?20:0))]
        ),
      ),


    ];
    return Scaffold(
      body: PageView(
          children: list,
          scrollDirection: Axis.horizontal,
          // reverse: true,
          physics: const BouncingScrollPhysics(),
          controller: controller,
          onPageChanged: (num) {
            setState(() {
              _curr = num;
              active = !active;
            });
          })

    );
  }
}
