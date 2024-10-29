import 'package:crave_it/screens/auth_screen.dart';
import 'package:crave_it/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Crave It",
      home: AuthStateHandler(), // This will manage the auth state
    );
  }
}

class AuthStateHandler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(body: Center(child: CircularProgressIndicator())); // Loading
        } else if (snapshot.hasData) {
          // If a user is logged in, navigate to the home screen
          return HomeScreen();
        } else {
          // If the user is not logged in, show the authentication screen
          return AuthScreen();
        }
      },
    );
  }
}
