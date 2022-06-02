import 'dart:io';
import 'dart:math';

import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../widgets/appbar.dart';
import '../../widgets/check_box.dart';
import '../../widgets/flar_class.dart';
import '../../widgets/floating_circle.dart';
import '../../widgets/pick_image_p.dart';
import '../../widgets/radio2+2.dart';
import '../../widgets/radio_listTile.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/select_text.dart';
import '../../widgets/slider_widget.dart';
import '../../widgets/toast.dart';
import '../../widgets/tramsform_shap.dart';
import '../../widgets/url.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  Offset position = const Offset(100, 100);
  double prevScale = 1;
  double scale = 1;

  void updateScale(double zoom) => setState(() => scale = prevScale * zoom);
  void commitScale() => setState(() => prevScale = scale);
  void updatePosition(Offset newPosition) =>
      setState(() => position = newPosition);





  double _value=0.0;
  bool _isContainerVisible = true; // in top of your class


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body:  OfflineBuilder(
        connectivityBuilder: (
            BuildContext context,
            ConnectivityResult connectivity,
            Widget child,
            ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if(connected){
            Future.delayed(const Duration(seconds: 3)).then((value) {
              if(mounted) {
                setState((){
                  _isContainerVisible = false;
                });
              }
            });

              }
          return SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                    duration: const Duration(milliseconds: 350),
                    child: connected
                        ? _isContainerVisible ? Container(
                        color: Colors.lightGreenAccent[400],
                        height: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Text(
                              'ONLINE',
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        )):Container()
                        : Container(
                      color: Colors.red,
                      height: 25,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const <Widget>[
                          Text(
                            'OFFLINE',
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(width: 8.0),
                          SizedBox(
                            width: 12.0,
                            height: 12.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ))      ,
                NavBar(),
                const buildRadioWithDialog(),
                const buildCheckBoxListTile(),
                const buildRadioListTileContainer(),
                const buildSlider(),
                Text('${_value.round()}'),
                buildRichText(),
                buildSelectableText(),
                buildToast(),
                buildTransform(_value),
                TextButton(onPressed: (){
                  showDialogWidgets(context);
                }, child: const Text("Show Dialog")),
                getImageWithCamera(),
                buildRaisedButtonToLaunchlink(),
                GestureDetector(
                  onScaleUpdate: (details) => updateScale(details.scale),
                  onScaleEnd: (_) => commitScale(),
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Stack(
                      children: [
                        Positioned.fill(
                            child: Container(color: Colors.amber.withOpacity(.4))),
                        Positioned(
                          left: position.dx,
                          top: position.dy,
                          child: Draggable(
                            maxSimultaneousDrags: 1,
                            feedback:const Icon(Icons.ten_mp),
                            childWhenDragging: const Opacity(
                              opacity: .3,
                              child: Icon(Icons.ten_mp),
                            ),
                            onDragEnd: (details) => updatePosition(details.offset),
                            child: Transform.scale(
                              scale: scale,
                              child: const Icon(Icons.ten_mp),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Draggable<String>(
                  childWhenDragging: Container(),
                  // Data is the value this Draggable stores.
                  data: 'red',
                  child: Container(
                    height: 120.0,
                    width: 120.0,
                    child: const Center(
                      child: Icon(Icons.menu),
                    ),
                  ),
                  feedback: Container(
                    height: 120.0,
                    width: 120.0,
                    child: const Center(
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        child: const Text("")
      ),
      floatingActionButton: Builder(
        builder: (context) => CircleFloating(fabKey),
      ),
    );
  }
}








showDialogWidgets(BuildContext context) => showDialog(
  context: context,
  builder: (context) => _Dialog(),
);

class _Dialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unable to get current location',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Please make sure your location service is enabled and app has a permission.',
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              child: const Text('Open Setting'),
              onPressed: () async {

              },
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Search By City name'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Pick location from Google maps'),
            ),
          ],
        ),
      ),
    );
  }
}





