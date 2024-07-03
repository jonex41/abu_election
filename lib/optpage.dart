import 'package:abu_election/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import 'homeuser.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  // our form key
  final _formKey = GlobalKey<FormState>();
  String verificationIdG = '';
  // editing Controller
  final oTPEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    doOtpStuff();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies

    super.didChangeDependencies();
  }

  String getPhoneNumber(String value) {
    String phoneNumber = value;
    phoneNumber =
        phoneNumber.contains('+') ? phoneNumber.substring(1) : phoneNumber;
    phoneNumber = phoneNumber.contains('234')
        ? phoneNumber
        : '+234${phoneNumber.substring(1)}';
    print(phoneNumber);
    //presentPhoneNumber = phoneNumber;
    return phoneNumber;
  }

  void doOtpStuff() async {
    String phoneNumber = getStringAsync('phone');
    phoneNumber = getPhoneNumber(phoneNumber);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Unable to send otp due to ${e.message}")));
      },
      codeSent: (String verificationId, int? resendToken) {
        print('my otp $verificationId');
        verificationIdG = verificationId;
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Otp sent please enter otp")));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    //staff id Field
    final staffPhoneNumber = TextFormField(
      cursorColor: Colors.green[800],
      autofocus: false,
      controller: oTPEditingController,
      keyboardType: TextInputType.text,
      //validator () {},
      onSaved: (value) {
        oTPEditingController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.security,
          color: Colors.green[800],
        ),
        contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
        hintText: "Enter OTP",
        hintStyle: TextStyle(color: Colors.green[800]),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    // login button
    final loginButton = Material(
      elevation: 3,
      color: Colors.green[800],
      borderRadius: BorderRadius.circular(30),
      child: MaterialButton(
        padding: const EdgeInsets.fromLTRB(20, 13, 20, 15),
        minWidth: MediaQuery.of(context).size.width,
        onPressed: () async {
          if (oTPEditingController.text.trim().isNotEmpty &&
              oTPEditingController.text.trim().length == 6) {
            showLoaderNew(context);
            PhoneAuthCredential credential = PhoneAuthProvider.credential(
              verificationId: verificationIdG,
              smsCode: oTPEditingController.text.trim(),
            );

            FirebaseAuth.instance
                .signInWithCredential(credential)
                .then((value) {
              hideLoaderNew();
              if (value.user != null) {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomeUser()));
              }
            }).onError((error, stackTrace) {
              hideLoaderNew();
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Otp invalid')));
            });
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('OTP invalid, please enter the right OTP')));
          }
        },
        child: const Text(
          "Login",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[800],
        title: const Text("Authentication Page"),
        centerTitle: true,
      ),
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
                    Text(
                      "To Proceed Into The Election Field,",
                      style: TextStyle(fontSize: 15, color: Colors.green[900]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "You Must Provide The OTP,",
                      style: TextStyle(fontSize: 15, color: Colors.green[900]),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      "That Was Send to Your Phone Number.",
                      style: TextStyle(fontSize: 15, color: Colors.green[900]),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    staffPhoneNumber,
                    const SizedBox(
                      height: 40,
                    ),
                    loginButton,
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
