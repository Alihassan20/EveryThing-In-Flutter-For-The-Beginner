import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class getImageWithCamera extends StatefulWidget {
  const getImageWithCamera({Key? key}) : super(key: key);

  @override
  _getImageWithCameraState createState() => _getImageWithCameraState();
}

class _getImageWithCameraState extends State<getImageWithCamera> {
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

  @override
  Widget build(BuildContext context) {
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
}
