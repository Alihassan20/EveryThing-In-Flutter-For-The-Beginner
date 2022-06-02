import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


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