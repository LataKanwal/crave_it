import 'package:crave_it/screens/fillacount_info_screen.dart';
import 'package:crave_it/screens/home_screen.dart';
import 'package:crave_it/widgets/custom_text_button.dart';
import 'package:crave_it/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({super.key});

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String emailText = '';
  String passwordText = '';

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: emailText,
        password: passwordText,
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text("Error"),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: Text("Okay"),
          ),
        ],
      ),
    );
  }

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: emailText);
      _showMessage("Password reset email sent!");
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xDD7A343D),
        actions: [
          TextButton(
            onPressed: emailText.isEmpty || passwordText.isEmpty ? () {} : _login,
            child: Text(
              "Continue",
              style: TextStyle(
                color: emailText.isEmpty || passwordText.isEmpty ? Colors.grey[400] : Color(0xDD7A343D),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView( // Wrap the entire body in SingleChildScrollView
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 15, bottom: 20),
                  child: Image.asset(
                    "assets/images/email.png",
                    width: 60,
                  ),
                ),
                Text(
                  "What's your email?",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text("We'll check if you have an account",
                    style: TextStyle(
                      fontSize: 14,
                    )),
                SizedBox(height: 30),
                CustomTextField(
                  controller: emailController,
                  labelText: "Email",
                  onChanged: (value) {
                    setState(() {
                      emailText = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                CustomTextField(
                  controller: passwordController,
                  labelText: "Password",
                  onChanged: (value) {
                    setState(() {
                      passwordText = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                // Link for Forgot Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: _resetPassword,
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: Color(0xDD7A343D)),
                    ),
                  ),
                ),
                // Link for Sign In
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FillAcountInfoScreen()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign In",
                      style: TextStyle(color: Color(0xDD7A343D)),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 35,
              color: Colors.grey[300],
            ),
            CustomTextButton(
              text: "Continue",
              onPressed: (emailText.isNotEmpty && passwordText.isNotEmpty) ? _login : () {},
              isDisabled: emailText.isEmpty || passwordText.isEmpty,
            ),
          ],
        ),
      ),
    );
  }
}
