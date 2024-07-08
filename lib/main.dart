import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_waste_web/screens/home_screen.dart';
import 'package:smart_waste_web/screens/login_screen.dart';
import 'package:smart_waste_web/screens/tabs/user_records_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyArBjull05oz-c1nlmpS3E_wLcDB_YQR1g",
          authDomain: "plastic-bottle-classifie-4077d.firebaseapp.com",
          projectId: "plastic-bottle-classifie-4077d",
          storageBucket: "plastic-bottle-classifie-4077d.appspot.com",
          messagingSenderId: "744621655610",
          appId: "1:744621655610:web:791a4470c8b0958cd81703"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
