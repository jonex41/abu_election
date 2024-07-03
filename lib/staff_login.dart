import 'package:abu_election/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'optpage.dart';

class StaffLoginPageScreen extends StatefulWidget {
  const StaffLoginPageScreen({super.key});

  @override
  State<StaffLoginPageScreen> createState() => _StaffLoginPageScreenState();
}

class _StaffLoginPageScreenState extends State<StaffLoginPageScreen> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final staffEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //staff id Field
    final staffIdField = TextFormField(
      cursorColor: Colors.green[800],
      autofocus: false,
      controller: staffEditingController,
      keyboardType: TextInputType.text,
      //validator () {},
      onSaved: (value) {
        staffEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person,
          color: Colors.green[800],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Staff Id",
        hintStyle: TextStyle(color: Colors.green[800]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // phoneNumber field
    final phoneNumberField = TextFormField(
      cursorColor: Colors.green[800],
      autofocus: false,
      controller: phoneNumberEditingController,
      obscureText: false,
      //validator () {},
      onSaved: (value) {
        phoneNumberEditingController.text = value!;
      },
      textInputAction: TextInputAction.none,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.call,
          color: Colors.green[800],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Staff Phone Number",
        hintStyle: TextStyle(color: Colors.green[800]),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );

    // register button
    final registerButton = Material(
      elevation: 3,
      color: Colors.green[800],
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            // await widget.addMessage(_controller.text);
            showLoaderNew(context);
            bool ggggg = false;
            FirebaseFirestore.instance
                .collection('Staffs')
                .get()
                .then((QuerySnapshot querySnapshot) {
              for (var doc in querySnapshot.docs) {
                String staffId = doc["staffId"];
                String staffPhone = doc["staffPhone"];
                print('$staffId           $staffPhone');

                if (staffEditingController.text.trim().toLowerCase() ==
                        staffId.toLowerCase() &&
                    phoneNumberEditingController.text.trim().toLowerCase() ==
                        staffPhone.toLowerCase()) {
                  //Navigator.pop(context);

                  hideLoaderNew();
                  ggggg = true;
                  //send code to phone
                  setValue('staffId', doc.id);
                  setValue('phone', phoneNumberEditingController.text.trim());

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OTPScreen()));

                  continue;
                }
              }
              if (!ggggg) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Please enter a valid Credentials')));
              }
            }).whenComplete(() {
              hideLoaderNew();
            });
          }
        },
        child: const Text(
          "Submit",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: Image.asset(
                        "lib/images/abulogo.jpeg",
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    Text(
                      "Staff Login Page",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800]),
                    ),
                    const SizedBox(
                      height: 45,
                    ),
                    staffIdField,
                    const SizedBox(
                      height: 35,
                    ),
                    phoneNumberField,
                    const SizedBox(
                      height: 35,
                    ),
                    registerButton,
                    const SizedBox(
                      height: 45,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
