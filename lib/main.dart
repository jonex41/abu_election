import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nb_utils/nb_utils.dart';
import 'homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyDoZcdev4IfrVVqd3X8ZPaPaHbiniHdhus",
          authDomain: "abu-election.firebaseapp.com",
          projectId: "abu-election",
          storageBucket: "abu-election.appspot.com",
          messagingSenderId: "466691223875",
          appId: "1:466691223875:web:df71856670b82e9fa57ff6",
          measurementId: "G-NM19KP8YZ6"));

  initialize();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "ABU ELECTION APP",
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
