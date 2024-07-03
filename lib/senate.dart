import 'package:abu_election/faculty_agricutre.dart';
import 'package:abu_election/faculty_basic_medical_sciences.dart';
import 'package:abu_election/pharmaceutical.dart';
import 'package:flutter/material.dart';

import 'abu_bussiness_sch.dart';
import 'cert.dart';
import 'cils.dart';
import 'faculty_of_administration.dart';
import 'faculty_of_allied_health_sciences.dart';
import 'faculty_of_arts.dart';
import 'faculty_of_basics_clinical_sciences.dart';
import 'faculty_of_clinical_sciences.dart';
import 'faculty_of_education.dart';
import 'faculty_of_engineering.dart';
import 'faculty_of_enviromental.dart';
import 'faculty_of_law.dart';
import 'faculty_of_life_sciences.dart';
import 'faculty_of_physical_sciences.dart';
import 'faculty_of_social_sciences.dart';
import 'faculty_of_veterinary.dart';
import 'iar.dart';
import 'institute_of_education.dart';
import 'napri.dart';

class senatePage extends StatefulWidget {
  const senatePage({super.key});

  @override
  State<senatePage> createState() => _senatePageState();
}

class _senatePageState extends State<senatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("INSTITUTES/CENTRES".toUpperCase()),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10, bottom: 40),
            child: Center(
                child: Text(
              "Tap to Vote For Your Contestants",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.green[900]),
            )),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => abuBussinessSchool()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "ABU Business School",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => certPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "CERT",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => cilsPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "CILS",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_AgricPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Administration",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_Agriculture()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Agriculture",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_ArtsPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Arts",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_EducationPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Education",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_EngineeringPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Engineering",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_EnviromentalDesignPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Enviromental Design",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_LifeSciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Life Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_LawPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Law",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_Allied_Health_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Allied Health Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_Clinical_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Clinical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
           GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_basics_medicine_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Basic Medical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_Clinical_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Basic Medical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          faculty_of_basics_Clinical_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Basic Clinical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => pharmaceuticalPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Pharmaceutical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_ofphysical_sciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Physical Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => faculty_of_Socail_SciencesPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Social Sciences",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => faculty_Veternary())));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Faculty of Veterinary Medicine",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => institute_of_EducationPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "Institute of Education",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => iarPage()));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "IAR",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => napriPage())));
            },
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
                    width: 400,
                    child: Center(
                        child: Text(
                      "NAPRI",
                      style: TextStyle(fontSize: 20, color: Colors.green[900]),
                    )))),
          ),
        ],
      ),
    );
  }
}
