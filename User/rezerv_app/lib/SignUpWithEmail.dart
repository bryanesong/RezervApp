import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';


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
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 50),
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
                  TextFormField(
                    obscureText: true,
                    controller: passwordController,
                    validator: (val){
                      if(val.isEmpty){
                        return 'Empty';
                      }
                      return null;
                    },
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
                  TextFormField(
                    obscureText: true,
                    controller: confirmPasswordController,
                    validator: (val){
                      if(val.isEmpty)
                        return 'Empty';
                      if(val != passwordController.text)
                        return 'Not Matching Passwords';
                      return null;
                    },
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
                onPressed: (){
                  createAccountWithEmailAndPassword();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  final databaseReference = FirebaseDatabase.instance.reference();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<void> createAccountWithEmailAndPassword() async {
    //check if emails match up
    if(passwordController.text != confirmPasswordController.text){
      showPasswordMatchDialog("Passwords do not match.");
    }else{
      try {
        await auth.createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString()
        );

        //if created successfully then add email/first/last name to database
        final FirebaseUser user = await firebaseAuth.currentUser();
        final uid = user.uid;
        databaseReference.child("Users").child(uid.toString()).set({
          'First Name': firstNameController.text,
          'Last Name': lastNameController.text,
        });

        //navigate to home screen
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpWithEmail()));
      } on AuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.'); //for console
          showPasswordMatchDialog('The password provided is too weak.');//for user
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');//for console
          showPasswordMatchDialog('The account already exists for that email.');//for user
        }
      } catch (e) {
        if(e.code == 'ERROR_INVALID_EMAIL'){
          print('Invalid email');//for console
          showPasswordMatchDialog('Invalid Email.');//for user
        }else{
          print("ERROR CODE:"+e.code);
        }
      }
    }
  }

  double getWidthPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  double getHeightPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }

  Future<void> showPasswordMatchDialog(String msg) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(msg),
              ],
            ),
          ),
          actions: <Widget>[
            RaisedButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }



}