import 'package:crave_it/screens/email_auth_screen.dart';
import 'package:crave_it/screens/verification_email_screen.dart';
import 'package:crave_it/widgets/custom_text_button.dart';
import 'package:crave_it/widgets/custom_text_field.dart';
import 'package:crave_it/screens/fillacount_info_screen.dart';
import 'package:flutter/material.dart';


class LoginWithEmailScreen extends StatefulWidget {
  const LoginWithEmailScreen({super.key});

  @override
  State<LoginWithEmailScreen> createState() => _LoginWithEmailScreenState();
}

class _LoginWithEmailScreenState extends State<LoginWithEmailScreen> {
  TextEditingController passController = TextEditingController();
  String passText ='' ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Color(0xDD7A343D),
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
                  Padding(padding: EdgeInsets.only(left: 15,bottom: 20),
                    child: Image.asset("assets/images/login.png",
                      width: 60,
                    ),
                  ),
                  Text("Login with your email",
                    style:TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text("Login with your password",
                      style:TextStyle(
                        fontSize: 14,
                      )),
                  SizedBox(height: 30),
                  CustomTextField(
                    controller: passController,
                    labelText: "Password",
                    noIcon: false,
                    onChanged: (value){
                      setState(() {
                        passText = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {} ,
                    child: Text(
                      "I forgot my password ?",
                      style: TextStyle(
                        color: Color(0xDD7A343D),
                            fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
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
                  text: "Login with password",
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context)=>
                              FillAcountInfoScreen(),
                        ));
                  },
                  isDisabled: passText.isEmpty
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context)=> VerificationEmailScreen(),
                      ));

                } ,
                child: Container(
                  width: double.infinity,
                  height: 58,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xDD7A343D)),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Send me a login link",
                      style: TextStyle(
                        color: Color(0xDD7A343D),
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )

        ],
      ),
      ),
    );
  }
}
