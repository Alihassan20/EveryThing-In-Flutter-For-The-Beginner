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
import '../../widgets/radio2+2.dart';
import '../../widgets/radio_listTile.dart';
import '../../widgets/rich_text.dart';
import '../../widgets/slider_widget.dart';

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


//ــــــــــــــــــــــــــــــ   SelectecdText   ـــــــــــــــــــــــــــــــــــــــ

  Center buildSelectableText() {
    return const Center(
        child: SelectableText(
          "MY NAME IS ALI ELMAHDY AND IAM ZAMALEK FAN",
          cursorColor: Colors.deepPurple,
          showCursor: true,
          cursorWidth: 5,
        ));
  }
//ــــــــــــــــــــــــــــــ   Toast   ـــــــــــــــــــــــــــــــــــــــ

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
//ــــــــــــــــــــــــــــــ   Transform   ـــــــــــــــــــــــــــــــــــــــ
  double _value=0.0;
  Transform buildTransform() {
    return Transform.rotate(
      angle: _value * (pi / 180),
      child: Container(
        height: _value,
        width: _value,
        color: Colors.black,
      ),
    );
  }

//ــــــــــــــــــــــــــــــ   PickImage   ـــــــــــــــــــــــــــــــــــــــ
  File? _image;
  final picker = ImagePicker();
  Future getImagePhoto(ImageSource src) async {
    final  pickedImage = await picker.pickImage(source: src);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        print("nonn");
      }
    });
  }
  Column getImageWithCamera(BuildContext context) {
    return Column(
      children: [
        Center(
          child:
          _image == null ? const Text("No Image Selected") : Image.file(_image!),
        ),
        ElevatedButton(onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: const Text("Choose picture from"),
                  content: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: [
                        const Divider(
                          color: Colors.black,
                        ),
                        Container(
                          width: 300,
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.image),
                            title: const Text("Gallery"),
                            onTap: () {
                              getImagePhoto(ImageSource.gallery);
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          color: Colors.teal,
                          child: ListTile(
                            leading: const Icon(Icons.add_a_photo),
                            title: const Text("Camera"),
                            onTap: () {
                              getImagePhoto(ImageSource.camera);
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        }, child: const Icon(Icons.flip_camera_ios_outlined))
      ],
    );
  }

//ــــــــــــــــــــــــــــــ   GetUrl   ـــــــــــــــــــــــــــــــــــــــ
  String str = "get the link";
  var url = "https://www.youtube.com/";
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(url), mode: LaunchMode.inAppWebView,
    )) throw 'Could not launch $url';
  }
  Center buildRaisedButtonToLaunchlink() {
    return Center(
      child: TextButton.icon(
        onPressed: _launchUrl,
        icon: const Icon(Icons.account_box_outlined),
        label: Text(str),
      ),
    );
  }
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
                buildSlider(),
                Text('${_value.round()}'),
                buildRichText(),
                buildSelectableText(),
                buildToast(),
                buildTransform(),
                TextButton(onPressed: (){
                  showDialogWidgets(context);
                }, child: const Text("Show Dialog")),
                getImageWithCamera(context),
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
        builder: (context) => FabCircularMenu(
          key: fabKey,
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
                _showSnackBar(context, "You pressed 1");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(Icons.looks_one, color: Colors.black),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "You pressed 2");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(Icons.looks_two, color: Colors.black),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "You pressed 3");
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(Icons.looks_3, color: Colors.black),
            ),
            RawMaterialButton(
              onPressed: () {
                _showSnackBar(context, "You pressed 4. This one closes the menu on tap");
                fabKey.currentState!.close();
              },
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(24.0),
              child: const Icon(Icons.looks_4, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}




void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(milliseconds: 1000),
      )
  );
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





