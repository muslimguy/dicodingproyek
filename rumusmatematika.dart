import 'package:dicodingproyek/rumusbarisanderetdanaritmatika.dart';
import 'package:dicodingproyek/rumuskecepatan.dart';
import 'package:dicodingproyek/rumuskelilingdanruangbangundatar.dart';
import 'package:dicodingproyek/rumuspermukaandanbangunruang.dart';
import 'package:dicodingproyek/rumusskala.dart';
import 'package:flutter/material.dart';

import 'main.dart';

void main() {
  runApp(RumusMtk());
}

class RumusMtk extends StatelessWidget {
  const RumusMtk({Key? key}) : super(key: key);
  //variable menu
  final List<String> nama = const [
    "Rumus Mencari \n     Kecepatan",
    "Rumus Menghitung Skala",
    "Keliling dan Luas Bangun \n                  Datar",
    "Permukaan dan Volume \n           Bangun Ruang",
    "Barisan dan Deret \n        Aritmatika",
  ];
  //variable namafile
  final List<Widget> lokasi = const [
    RumusKecepatan(),
    RumusSkala(),
    RumusKelilingDanRuangBangunDatar(),
    RumusPermukaanDanBangunRuang(),
    RumusBarisanDeretDanAritmatika()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.yellow,
        ),
        home: SafeArea(
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(40.0),
                    ),
                    color: Colors.green[200],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30.0,
                          ),
                          SizedBox(
                            height: 80.0,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.arrow_back),
                                  Text("Go Back"),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 40.0,
                          ),
                          Expanded(
                            child: Text(
                              "Kumpulan Rumus MTK",
                              style: TextStyle(
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Expanded(
                  child: Container(
                    color: Colors.green[200],
                    child: ListView.builder(
                        itemCount: nama.length,
                        itemBuilder: (BuildContext context, index) => Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Expanded(
                                        child: Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              elevation: 20.0,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30.0)),
                                            ),
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          lokasi[index]));
                                            },
                                            child: Center(
                                              child: Container(
                                                height: 100.0,
                                                child: Center(
                                                  child: Text(
                                                    "${nama[index]}",
                                                    style: TextStyle(
                                                        fontSize: 30.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  )
                                ],
                              ),
                            )),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
