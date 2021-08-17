import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DisplayScreen extends StatelessWidget {
  final String name;
  final String track;

  DisplayScreen({required this.name, required this.track});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: CircleAvatar(
                child: Text('HNG'),
                radius: 50,
                backgroundImage: AssetImage('assets/download.png'),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(text: 'Welcome to HNG internship \n\t\t\t',
              style: Theme.of(context).textTheme.bodyText1, 
              children: [
                TextSpan(
                    text: name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,
                    )),
                TextSpan(
                    text: '\nThe ' +
                        track +
                        ' team will be happy to help you.\nCheck out this link for more details. \n'),
                TextSpan(
                    text: 'https://hng.tech/',
                    recognizer: new TapGestureRecognizer()
                    ..onTap = () { 
                      launch('https://hng.tech/');
                  },
                    style: TextStyle(color: Colors.blue,fontSize: 15))
              ]),
            ),
          )
        ],
      ),
    );
  }
}
