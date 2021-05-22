import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  SignUpWithEmailState createState() => SignUpWithEmailState();
}

class SignUpWithEmailState extends State<SignUpWithEmail> {

  //variables
  bool _checked = false;

  //initialize flutterfire
  FirebaseAuth auth = FirebaseAuth.instance;

  //initialize textControllers used for getting information from textFields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController =TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rezerv",
                  style: TextStyle(fontSize: 50),
                ),
                Image.asset('assets/rezervLogo.png'),
              ],
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("First Name", style: TextStyle(fontSize: 25)),
                  TextField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Last Name", style: TextStyle(fontSize: 25)),
                  TextField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(fontSize: 25)),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password", style: TextStyle(fontSize: 25)),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Confirm Password", style: TextStyle(fontSize: 25)),
                  TextField(
                    controller: confirmPasswordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()),
                  ),
                ],
              ),
            ),
            Container(
              width: getWidthPercentageInPixels(83),
              alignment: Alignment.center,
              child: CheckboxListTile(
                title: const Text('I accept the Terms of Use & Privacy Policy'),
                controlAffinity: ListTileControlAffinity.leading,
                value: _checked,
                onChanged: (bool value){
                  setState(() {
                    print("Remember me check was pressed. Current value: "+value.toString()); //used for debugging
                    _checked = value;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: getWidthPercentageInPixels(60),
              height: getHeightPercentageInPixels(5),
              child: RaisedButton(
                child:
                Text("Sign Up", style: TextStyle(fontSize: 20)),
                onPressed: () => print("Sign in button pressed."),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void createAccountWithEmail(){

  }

  double getWidthPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  double getHeightPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }

}