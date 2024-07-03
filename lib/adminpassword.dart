import 'package:abu_election/loader.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:abu_election/adminpage.dart';

class AdminPassword extends StatefulWidget {
  const AdminPassword({super.key});

  @override
  State<AdminPassword> createState() => _AdminPasswordState();
}

class _AdminPasswordState extends State<AdminPassword> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  // editing Controller
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final comfirmPasswordEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    // password field
    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordEditingController,
      obscureText: true,
      //validator () {},
      onSaved: (value) {
        passwordEditingController.text = value!;
      },
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter right password';
        }
        return null;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter Admin Password",
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );

    // submitbutton button
    final submitButton = Material(
      elevation: 3,
      color: Colors.green,
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () {
          showLoaderNew(context);
          if (_formKey.currentState!.validate()) {
            FirebaseFirestore.instance
                .collection('admin')
                .doc('9MzyA3lswjMUFrC1jKYN')
                .get()
                .then((value) {
              if (passwordEditingController.text == value['loginPassword']) {
                  hideLoaderNew();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => adminPage()));
              } else {
                  hideLoaderNew();
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password does not match')));
              }
            });
          
          } else {
            hideLoaderNew();
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
                      passwordField,
                      const SizedBox(
                        height: 20,
                      ),
                      submitButton,
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
