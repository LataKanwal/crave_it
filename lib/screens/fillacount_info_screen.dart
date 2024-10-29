import 'package:crave_it/widgets/custom_text_button.dart';
import 'package:crave_it/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:crave_it/screens/home_screen.dart';

class FillAcountInfoScreen extends StatefulWidget {
  const FillAcountInfoScreen({super.key});

  @override
  State<FillAcountInfoScreen> createState() => _FillAcountInfoScreen();
}

class _FillAcountInfoScreen extends State<FillAcountInfoScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Firebase Auth instance
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  String firstNameText = '';
  String lastNameText = '';
  String emailText = '';
  String passText = '';

  Future<void> _register() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailText,
        password: passText,
      );

      // Optionally, you can save additional user data in Firestore if required
      // await FirebaseFirestore.instance.collection('users').add({
      //   'firstName': firstNameText,
      //   'lastName': lastNameText,
      //   'email': emailText,
      // });

      // Navigate to the home screen after registration
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } catch (e) {
      // Handle registration errors
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xDD7A343D),
        actions: [
          TextButton(
            onPressed: () {
              if (firstNameText.isNotEmpty &&
                  lastNameText.isNotEmpty &&
                  emailText.isNotEmpty &&
                  passText.isNotEmpty) {
                _register(); // Call the registration function
              }
            },
            child: Text(
              "Continue",
              style: TextStyle(
                color: firstNameText.isEmpty ||
                    lastNameText.isEmpty ||
                    emailText.isEmpty ||
                    passText.isEmpty
                    ? Colors.grey[400]
                    : Color(0xDD7A343D),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15, bottom: 20),
                      child: Image.asset(
                        "assets/images/profile.png",
                        width: 60,
                      ),
                    ),
                    Text(
                      "Let's get you started!",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text("First, let's create your Craveit account",
                        style: TextStyle(
                          fontSize: 14,
                        )),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          padding: EdgeInsets.only(right: 7),
                          child: CustomTextField(
                            controller: firstNameController,
                            labelText: "First Name",
                            onChanged: (value) {
                              setState(() {
                                firstNameText = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2 - 15,
                          padding: EdgeInsets.only(right: 7),
                          child: CustomTextField(
                            controller: lastNameController,
                            labelText: "Last Name",
                            onChanged: (value) {
                              setState(() {
                                lastNameText = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
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
                      controller: passController,
                      labelText: "Password",
                      onChanged: (value) {
                        setState(() {
                          passText = value;
                        });
                      },
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                Divider(
                  height: 40,
                  color: Colors.grey[200],
                ),
                CustomTextButton(
                  text: "Continue",
                  onPressed: () {
                    if (firstNameText.isNotEmpty &&
                        lastNameText.isNotEmpty &&
                        emailText.isNotEmpty &&
                        passText.isNotEmpty) {
                      _register(); // Call the registration function
                    }
                  },
                  isDisabled: firstNameText.isEmpty ||
                      lastNameText.isEmpty ||
                      emailText.isEmpty ||
                      passText.isEmpty,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
