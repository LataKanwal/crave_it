import 'package:crave_it/widgets/custom_text_button.dart';
import 'package:crave_it/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class VerificationEmailScreen extends StatefulWidget {
  const VerificationEmailScreen({super.key});

  @override
  State<VerificationEmailScreen> createState() => _VerificationEmailScreenState();
}

class _VerificationEmailScreenState extends State<VerificationEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xFFFF2B85),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 20),
                    child: Image.asset(
                      "assets/images/email.png",
                      width: 80,
                    ),
                  ),
                  Text("Verify your email address to get started",
                    textAlign: TextAlign.center,
                    style:TextStyle(

                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("this help us to mitigate fraud and keep your personal data safe",
                      textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 12,
                      )),
                ],
              ),
            ),
            Column(
              children: [
                Divider(
                  height: 40,
                  color: Colors.grey[200],
                ),
                CustomTextButton(
                    text: "send verification email",
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context)=> LoginWithEmailScreen(),
                      //     ));
                    },
                    isDisabled: false,
                ),
              ],
            )

          ],
        ),),
    );
  }
}
