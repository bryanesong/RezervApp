import 'package:flutter/material.dart';
import 'SignUpWithEmail.dart';
import 'NavBar.dart';

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
  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 50),
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
              padding: EdgeInsets.all(getHeightPercentageInPixels(2)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Log In to \nRezerv Business",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(getHeightPercentageInPixels(1)),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email", style: TextStyle(fontSize: 25)),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'email@example.com',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(getHeightPercentageInPixels(0.5)),
            ),
            Container(
              width: getWidthPercentageInPixels(70),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Password", style: TextStyle(fontSize: 25)),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
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
                onChanged: (bool value) {
                  setState(() {
                    print("Remember me check was pressed. Current value: " +
                        value.toString()); //used for debugging
                    _checked = value;
                  });
                },
              ),
            ),
            ButtonTheme(
              minWidth: getWidthPercentageInPixels(60),
              height: getHeightPercentageInPixels(5),
              child: ElevatedButton(
                child: Text("Sign In", style: TextStyle(fontSize: 20)),
                onPressed: () {
                  print("Sign in button pressed");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NavBar()));
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomPaint(
                  size: Size(getWidthPercentageInPixels(30),
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
                  size: Size(getWidthPercentageInPixels(30),
                      getHeightPercentageInPixels(2)),
                  painter: LinePainter(),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    "New to Rezerv Business? \nClick here to apply for an \nestablishment account",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20)),
              ],
            ),
            ButtonTheme(
              minWidth: getWidthPercentageInPixels(60),
              height: getHeightPercentageInPixels(5),
              child: ElevatedButton(
                child: Text("Apply for partnership",
                    style: TextStyle(fontSize: 20)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpWithEmail()),
                  );
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
