import 'package:abu_election/governingcouncil.dart';
import 'package:abu_election/homepage.dart';
import 'package:abu_election/searchteam.dart';
import 'package:abu_election/senate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'about.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  Map<String, dynamic> governingCouncil = {};
  Map<String, dynamic> searchTeamMap = {};
  Map<String, dynamic> senate = {};
  @override
  Widget build(BuildContext context) {
    CollectionReference users =
        FirebaseFirestore.instance.collection('ongoing');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text(
          "Welcome Back",
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.green[900]),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.green[200],
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "lib/images/abulogo.jpeg",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.green[800],
                ),
                title: Text(
                  "Home",
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeUser()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: Icon(
                  Icons.help,
                  color: Colors.green[800],
                ),
                title: Text(
                  "About",
                  style: TextStyle(fontSize: 20, color: Colors.green[900]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AboutTheApp()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              /*    ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.green[800],
                ),
                title: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: ((context) => Settings())));
                  },
                  child: Text(
                    "Settings",
                    style: TextStyle(fontSize: 20, color: Colors.green[900]),
                  ),
                ),
              ), */
              const SizedBox(
                height: 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.red[800],
                ),
                title: Text(
                  "Logout",
                  style: TextStyle(fontSize: 20, color: Colors.red[600]),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                },
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, top: 30, right: 15),
                  child: Text(
                    "What type of Voting,",
                    style: TextStyle(fontSize: 23, color: Colors.green[900]),
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Center(
                child: Text(
                  "Are You going to do?",
                  style: TextStyle(fontSize: 23, color: Colors.green[900]),
                ),
              ),
            ],
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FutureBuilder<DocumentSnapshot>(
                  future: users.doc('governingCouncil').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return showWithText(true);
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return showWithText(true);
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      governingCouncil =
                          snapshot.data!.data() as Map<String, dynamic>;
                      // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                      return showWithText(false);
                    }

                    return const Center(child: Text("loading...."));
                  },
                ),
                FutureBuilder<DocumentSnapshot>(
                  future: users.doc('searchTeam').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return showWithText2(true);
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return showWithText2(true);
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      searchTeamMap =
                          snapshot.data!.data() as Map<String, dynamic>;
                      // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                      return showWithText2(false);
                    }

                    return const Center(child: Text(""));
                  },
                ),
                FutureBuilder<DocumentSnapshot>(
                  future: users.doc('senate').get(),
                  builder: (BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
                      return showWithText3(true);
                    }

                    if (snapshot.hasData && !snapshot.data!.exists) {
                      return showWithText3(true);
                    }

                    if (snapshot.connectionState == ConnectionState.done) {
                      senate = snapshot.data!.data() as Map<String, dynamic>;
                      // return Text("Full Name: ${data['full_name']} ${data['last_name']}");
                      return showWithText3(false);
                    }

                    return const Center(child: Text(""));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget showWithText(bool isLoading) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (governingCouncil['ongoing'] == 'yes') {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const GoverningCouncil())));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voting has not started yet')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 15),
            child: Container(
              height: 200,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "GOVERNING COUNCIL",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          governingCouncil['time'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 20),
                        child: Text(
                          governingCouncil['date'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      //  10.width
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Text(
                        governingCouncil['ongoing'] == 'yes'
                            ? "Ongoing"
                            : 'Stopped',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget showWithText2(bool isLoading) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (searchTeamMap['ongoing'] == 'yes') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const searchTeam()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voting has not started yet')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 15),
            child: Container(
              height: 200,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "SEARCH TEAM",
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          searchTeamMap['time'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 20),
                        child: Text(
                          searchTeamMap['date'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Text(
                        searchTeamMap['ongoing'] == 'yes'
                            ? "Ongoing"
                            : 'Stopped',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget showWithText3(bool isLoading) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (senate['ongoing'] == 'yes') {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const senatePage()));
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Voting has not started yet')));
            }
          },
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 30, 8, 15),
            child: Container(
              height: 200,
              width: 370,
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  const Center(
                      child: Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "SENATE",
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          senate['time'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 100, right: 20),
                        child: Text(
                          senate['date'],
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 17),
                      child: Text(
                        senate['ongoing'] == 'yes' ? "Ongoing" : 'Stopped',
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
