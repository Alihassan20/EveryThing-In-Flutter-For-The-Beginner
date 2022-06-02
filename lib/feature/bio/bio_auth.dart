import 'package:flutter/material.dart';

import '../../core/helper.dart';
import '../page_animated/page_view.dart';



class BioAuth extends StatefulWidget {
  const BioAuth({Key? key}) : super(key: key);

  @override
  _BioAuthState createState() => _BioAuthState();
}

class _BioAuthState extends State<BioAuth> {

  bool showBiometric = false;
  @override
  void initState() {
    isBiometricsAvailable();
    super.initState();
  }

  isBiometricsAvailable() async {
    showBiometric = await BiometricHelper().hasEnrolledBiometrics();
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (showBiometric)
              MaterialButton(
                color: Colors.blue,
                child: const Text(
                  'Biometric Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onPressed: () async {
                  await BiometricHelper().authenticate();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const Page_Animated()));
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
}
