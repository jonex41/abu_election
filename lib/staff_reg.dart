import 'package:abu_election/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class StaffRegistrationScreen extends StatefulWidget {
  const StaffRegistrationScreen({super.key});

  @override
  State<StaffRegistrationScreen> createState() =>
      _StaffRegistrationScreenState();
}

class _StaffRegistrationScreenState extends State<StaffRegistrationScreen> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final staffEditingController = TextEditingController();
  final phoneNumberEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //staff id Field
    String getPhoneNumber(String value) {
      String phoneNumber = value;
      phoneNumber =
          phoneNumber.contains('+') ? phoneNumber.substring(1) : phoneNumber;
      phoneNumber = phoneNumber.contains('234')
          ? phoneNumber
          : '+234${phoneNumber.substring(1)}';
      //presentPhoneNumber = phoneNumber;
      return phoneNumber;
    }

    final staffIdField = TextFormField(
      cursorColor: Colors.green[800],
      autofocus: false,
      controller: staffEditingController,
      //keyboardType: TextInputType.number,
      //validator () {},
      onSaved: (value) {
        staffEditingController.text = value!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter Staff Id';
        }
        return null;
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
      validator: (String? value) {
        if (value == null || value.isEmpty || value.trim().length != 11) {
          return 'Enter right password';
        }
        return null;
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
          showLoaderNew(context);
          if (_formKey.currentState!.validate()) {
            FirebaseFirestore.instance.collection('Staffs').add({
              'staffId': staffEditingController.text,
              'staffPhone': phoneNumberEditingController.text
            }).then((value) {
              hideLoaderNew();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text("Staff added")));
              Future.delayed(const Duration(seconds: 3), () {
                context.pop();
              });
            }).catchError((error) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Failed to add user: $error")));
            });
          } else {
            hideLoaderNew();
          }
        },
        child: const Text(
          "Register",
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
                      "Staffs Registration Field",
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
