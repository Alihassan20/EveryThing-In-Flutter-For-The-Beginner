
import 'package:flutter/material.dart';
class buildCheckBoxListTile extends StatefulWidget {
  const buildCheckBoxListTile({Key? key}) : super(key: key);

  @override
  _buildCheckBoxListTileState createState() => _buildCheckBoxListTileState();
}

class _buildCheckBoxListTileState extends State<buildCheckBoxListTile> {
  Set<String> txt={};
  bool _js= false;
  bool _cSharp= false;
  bool _python= false;
  @override
  Widget build(BuildContext context) {
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
}
