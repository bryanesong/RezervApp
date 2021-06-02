import 'package:flutter/material.dart';

class SignUpWithEmail extends StatefulWidget {
  @override
  SignUpWithEmailState createState() => SignUpWithEmailState();
}

class SignUpWithEmailState extends State<SignUpWithEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply For Partnership"),
      ),
      body: ListView(
        padding: EdgeInsets.all(getHeightPercentageInPixels(5),),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Bob',
                  ),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Smith',
                  ),
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
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'email@example.com',
                  ),
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
            width: getWidthPercentageInPixels(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Establishment Name", style: TextStyle(fontSize: 25)),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Jim''s Gyms',
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: getWidthPercentageInPixels(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Establishment Type", style: TextStyle(fontSize: 25)),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Fitness Center',
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: getWidthPercentageInPixels(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Establishment Phone no.", style: TextStyle(fontSize: 25)),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '(555)-555-5555',
                  ),
                ),
              ],
            ),
          ),

          Container(
            width: getWidthPercentageInPixels(70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Establishment Address", style: TextStyle(fontSize: 25)),
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '123 Main St, Olympia, WA, 98501',
                  ),
                ),
              ],
            ),
          ),
        ],
      )
      );
  }
  double getWidthPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.width * (percent / 100);
  }

  double getHeightPercentageInPixels(double percent) {
    return MediaQuery.of(context).size.height * (percent / 100);
  }
}