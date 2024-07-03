import 'package:abu_election/staff_login.dart';
import 'package:flutter/material.dart';
import 'adminpassword.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget buildAdminBtn() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: 400,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminPassword()));
          },
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.green,
          child: Text(
            "ADMIN",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget buildStaffBtn() {
    return Center(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        width: 400,
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => StaffLoginPageScreen()));
          },
          padding: EdgeInsets.all(15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          color: Colors.green,
          child: Text(
            "STAFF",
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ABU CONGREGATION ELECTION"),
          elevation: 0,
          backgroundColor: Colors.green[700],
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "lib/images/abuimage.jpeg",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.green.withOpacity(0.2),
                      BlendMode.darken,
                    ),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildAdminBtn(),
                buildStaffBtn(),
              ],
            ),
          ],
        ));
  }
}
