import 'package:flutter/material.dart';

class AboutTheApp extends StatelessWidget {
  const AboutTheApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("About"),
      ),
      body: ListView(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
                height: 150,
                width: 150,
                child: Image.asset("lib/images/abulogo.jpeg")),
            SizedBox(
              height: 50,
            ),
            Text(
              "About the Election",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900]),
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                  "Congregation shall elect persons nearest in number, but not exceeding thirty percent of the total exofficio membership of the senate to represent it in Senate: The elected persons shall hold offfice for two years and are eligible for a second and final term. In this regard, 148 persons are to be elected into the Senate and to be eligible for a second and final term. In this regards, 148 persons are to be elected into the Senate and to be eligible if the Congregation decides to adopt the May 1999 guidelines i.e 'Such teachers of the rank of Assistant Lecturer/Assistant Research fellow and above, elected by congregation'.",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}
