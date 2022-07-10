import 'dart:async';

import 'package:dicodingproyek/aboutme.dart';
import 'package:dicodingproyek/rumusmatematika.dart';
import 'package:dicodingproyek/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polygon/flutter_polygon.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HalamanUtama(),
    );
  }
}

class HalamanUtama extends StatefulWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  State<HalamanUtama> createState() => _HalamanUtamaState();
}

StreamController _controller = StreamController.broadcast();

Stream get _stream => _controller.stream;

final namaController = TextEditingController();
final ada = namaController;

class _HalamanUtamaState extends State<HalamanUtama> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryTextTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.black),
        ),
        primarySwatch: Colors.yellow,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Wrap(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  height: 120.0,
                  child: Center(
                    child: Text(
                      "Simple Todo And Math Formula",
                      style: TextStyle(color: Colors.black, fontSize: 40.0),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(50)),
                    color: Colors.green[200],
                  ),
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Masukan Nama Anda !",
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Center(
                    child: TextFormField(
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide:
                              BorderSide(width: 3, color: Colors.yellow),
                        ),
                      ),
                      controller: namaController,
                      style: TextStyle(
                        fontSize: 40.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  child: Center(
                      child: Text(
                    "Selamat datang ",
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  )),
                ),
                Container(
                  child: Center(
                      child: Text(
                    ada.text,
                    style: TextStyle(
                      fontSize: 40.0,
                    ),
                  )),
                ),
              ],
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 375.0,
            ),
            SizedBox(
              width: 120.0,
              height: 120.0,
              child: FloatingActionButton(
                shape: PolygonBorder(sides: 6),
                child: Column(
                  children: [
                    SizedBox(
                      height: 15.0,
                    ),
                    Icon(
                      Icons.book,
                      size: 60.0,
                    ),
                    Text("About Me")
                  ],
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const AboutMe()));
                },
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
          ],
        ),
        bottomNavigationBar: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 75.0,
                color: Colors.green[300],
                child: Row(
                  children: [
                    SizedBox(
                      width: 75.0,
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text("Todo App"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) => Todo())));
                        },
                      ),
                    ),
                    SizedBox(
                      width: 50.0,
                    ),
                    SizedBox(
                      width: 100.0,
                      height: 50.0,
                      child: ElevatedButton(
                        child: Text("  Rumus   Matematik"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RumusMtk()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
