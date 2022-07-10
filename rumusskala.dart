import 'package:flutter/material.dart';

void main() {
  runApp(RumusSkala());
}

class RumusSkala extends StatelessWidget {
  const RumusSkala({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.yellow),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(40.0)),
                color: Colors.green[200],
              ),
              height: 150.0,
              child: Row(
                children: [
                  SizedBox(
                    width: 20.0,
                  ),
                  SafeArea(
                      child: Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),
                        SizedBox(
                          height: 75.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                Icon(Icons.arrow_back),
                                Center(
                                    child: Text(
                                  "Go Back",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  )),
                  SizedBox(
                    width: 20.0,
                  ),
                  Expanded(
                    child: Text(
                      "Rumus Mencari Skala",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 40.0),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Image.asset("images/rumusskala.png")
          ],
        ),
      ),
    );
  }
}
