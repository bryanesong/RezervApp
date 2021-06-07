import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'SignUpWithEmail.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //variables
  bool _checked = false;


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
            Padding(
              padding: EdgeInsets.all(getHeightPercentageInPixels(5)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Log In to Rezerv", style: TextStyle(fontSize: 25)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("New to Rezerv? Click here to sign up",
                    style: TextStyle(fontSize: 15)),
              ],
            ),
            ButtonTheme(
              minWidth: getWidthPercentageInPixels(60),
              height: getHeightPercentageInPixels(5),
              child: RaisedButton(
                child:
                    Text("Sign Up with Email", style: TextStyle(fontSize: 20)),
                onPressed: (){
                  print("sign up with email button pressed");
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpWithEmail()));
                },
              ),
            ),
            ButtonTheme(
              minWidth: getWidthPercentageInPixels(60),
              height: getHeightPercentageInPixels(5),
              child: RaisedButton(
                child:
                    Text("Sign up with GOOGLE", style: TextStyle(fontSize: 20)),
                onPressed: () => print("sign up with google button pressed"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(getWidthPercentageInPixels(40),
                      getHeightPercentageInPixels(2)),
                  painter: LinePainter(),
                ),
                Padding(
                  padding: EdgeInsets.all(getHeightPercentageInPixels(1)),
                ),
                Text("or"),
                Padding(
                  padding: EdgeInsets.all(getHeightPercentageInPixels(1)),
                ),
                CustomPaint(
                  size: Size(getWidthPercentageInPixels(40),
                      getHeightPercentageInPixels(2)),
                  painter: LinePainter(),
                ),
              ],
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(fontSize: 25)),
                  TextField(
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
                title: const Text('Remember Me'),
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
                Text("Sign In", style: TextStyle(fontSize: 20)),
                onPressed: (){
                  print("Sign in button pressed.");

                  //will need sign in verification but placeholder for now
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreen()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  double getWidthPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  double getHeightPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
