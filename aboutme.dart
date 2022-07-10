import 'dart:async';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:dicodingproyek/main.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

void main() {
  runApp(AboutMe());
}

class AboutMe extends StatelessWidget {
  const AboutMe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black, fontSize: 60.0),
        ),
        primarySwatch: Colors.yellow,
      ),
      home: HalamanDua(),
    );
  }
}

class HalamanDua extends StatefulWidget {
  const HalamanDua({Key? key}) : super(key: key);

  @override
  State<HalamanDua> createState() => _HalamanDuaState();
}

class _HalamanDuaState extends State<HalamanDua> {
  final text1 = const TextStyle(
    color: Colors.black,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
  );

  final email = const TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
  );
//encode email string
  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  //kirim email
  _sendingMails() async {
    final Uri url = Uri(
      scheme: 'mailto',
      path: 'bayu.kurniawan9868@gmail.com',
      query: encodeQueryParameters(<String, String>{
        'subject': 'Simple Todo Apps',
        'body': 'Halo saya ada pertanyaan untuk aplikasinya...'
      }),
    );

    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.green[200],
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40.0))),
              height: 150,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 30.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HalamanUtama()));
                        },
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 20.0,
                              ),
                              Icon(Icons.arrow_back),
                              Text("Go back"),
                              SizedBox(
                                height: 20.0,
                              ),
                            ]),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  Text(
                    "About Me",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 70.0,
            ),
            Expanded(
              child: Container(
                height: 1000.0,
                decoration: BoxDecoration(
                    color: Colors.green[200],
                    shape: BoxShape.rectangle,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(100.0))),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        "Name : ",
                        style: text1,
                      ),
                    ),
                    SizedBox(
                      width: 20.0,
                    ),
                    Center(
                      child: Text(
                        "Muhammad",
                        style: text1,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Bayu",
                        style: text1,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Kurniawan",
                        style: text1,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Image.asset(
                          "images/bayu.jpg",
                          scale: 1,
                          height: 250.0,
                          width: 400.0,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 150.0,
                      child: Column(
                        children: [
                          Text(
                            "Contact Me :",
                            style: text1,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.yellow,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(40.0))),
                            onPressed: _sendingMails,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 50.0,
                                    ),
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "Click To Send Email to :          bayu.kurniawan9868@gmail.com",
                                          style: email,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.0,
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.mail,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
