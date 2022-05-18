import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
//ــــــــــــــــــــــــــــــ   appbar   ـــــــــــــــــــــــــــــــــــــــ

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
//ــــــــــــــــــــــــــــــ   radio list 2+2   ـــــــــــــــــــــــــــــــــــــــ

  int radioValue2 = 0;
  String  result = '';
  Color resultColor = Colors.yellow;
  Container buildRadioWithDialog() {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          const Text(
            ' Guess The Answer :   2+2 = ? \n',
            style:  TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          buildRadio1(3),
          buildRadio1(4),
          buildRadio1(5),
        ],
      ),
    );
  } Row buildRadio1(int value) {
    return Row(
      children: [
        Radio(
            value: value,
            groupValue: radioValue2,
            onChanged: (val) {
              setState(() {
                radioValue2 = val as int;
                result = value == 4 ? "Correct Answer 👏" : "Wrong Answer 👎";
                resultColor = value == 4 ? Colors.black : Colors.red;
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(result.toString(),style: TextStyle(color: resultColor),),
                  ),
                );
              });
            }),
        Text("$value"),
      ],
    );
  }
//ــــــــــــــــــــــــــــــ  C# checkBox    ـــــــــــــــــــــــــــــــــــــــ

  Set<String> txt={};
  bool _js= false;
  bool _cSharp= false;
  bool _python= false;
  Container buildCheckBoxListTile(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Text("Selected the language you like ?"),
          const SizedBox(
            height: 30,
          ),
          CheckboxListTile(
            value: _js,
            onChanged: (value) {
              setState(() {
                _js = value!;
                if(value==true){
                  txt.add('Java Script');
                }else{
                  txt.remove('Java Script');
                }
              });
            },
            title: const Text("Java Script"),
          ),
          CheckboxListTile(
            value: _cSharp,
            onChanged: (value) {
              setState(() {
                _cSharp = value!;
                if(value==true){
                  txt.add('C#');
                }else{
                  txt.remove('C#');
                }
              });
            },
            title: const Text("C#"),
          ),
          CheckboxListTile(
            value: _python,
            onChanged: (value) {
              setState(() {
                _python = value!;
                if(value==true){
                  txt.add('Python');
                }else{
                  txt.remove('Python');
                }
              });
            },
            title: const Text("Python"),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      content: SizedBox(
                        height: 150,
                        child: Container(
                          margin: const EdgeInsets.all(12),
                          child: Column(
                            children:txt.map((e) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(e),
                            )).toList(),
                          ),
                        ),
                      ),
                      title: const Text("Thank you for you chooses"),
                    );
                  });
            },
            child: const Text("Apply !"),
          )
        ],
      ),
    );
  }
  //ــــــــــــــــــــــــــــــ   radioList red,green   ـــــــــــــــــــــــــــــــــــــــ

  var radioValue = 0;
  Container buildRadioListTileContainer() {
    return Container(
      color: radioValue == 0 ? Colors.red : Colors.green,
      padding: const EdgeInsets.all(30),
      child: Column(
        children: [
          buildRadioListTile(0, "Red", "Changed to Red"),
          buildRadioListTile(1, "Green", "Changed to Green"),
        ],
      ),
    );
  }
  RadioListTile<int> buildRadioListTile(val, String txt, String subTxt) {
    return RadioListTile(
      value: val,
      groupValue: radioValue,
      onChanged: (value) {
        setState(() {
          radioValue = value as int;
        });
      },
      title: Text('$txt'),
      subtitle: Text("$subTxt"),
    );
  }
//ــــــــــــــــــــــــــــــ   Slider   ـــــــــــــــــــــــــــــــــــــــ

  double _value=0.0;
  Slider buildSlider() {
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
//ــــــــــــــــــــــــــــــ   RichText   ـــــــــــــــــــــــــــــــــــــــ

  RichText buildRichText() {
    return RichText(
      text: const TextSpan(children: [
        TextSpan(
          text: "ali",
          style:  TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurpleAccent),
        ),
         TextSpan(
          text: " hassan",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent),
        )
      ]),
    );
  }
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
      child: Text("Toast"),
    );
  }
//ــــــــــــــــــــــــــــــ   Transform   ـــــــــــــــــــــــــــــــــــــــ
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
          _image == null ? Text("No Image Selected") : Image.file(_image!),
        ),
        ElevatedButton(onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: Text("Choose picture from"),
                  content: Container(
                    height: 200,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Divider(
                          color: Colors.black,
                        ),
                        Container(
                          width: 300,
                          color: Colors.teal,
                          child: ListTile(
                            leading: Icon(Icons.image),
                            title: Text("Gallery"),
                            onTap: () {
                              getImagePhoto(ImageSource.gallery);
                              Navigator.of(ctx).pop();
                            },
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 300,
                          color: Colors.teal,
                          child: ListTile(
                            leading: Icon(Icons.add_a_photo),
                            title: Text("Camera"),
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
        icon: Icon(Icons.account_box_outlined),
        label: Text(str),
      ),
    );
  }


@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildRadioWithDialog(),
            buildCheckBoxListTile(context),
            buildRadioListTileContainer(),
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
            buildRaisedButtonToLaunchlink()


          ],
        ),
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





