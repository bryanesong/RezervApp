import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum ScreenState{
  searchEstablishment,
  viewEstablishment,
  categories,
  profile,
}

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {

  final String ZIPCODE = "00000";//default placeholder for zipcode is 00000

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: getCurrentTopWidget(),
            ),
            Expanded(
              child: getCurrentMainWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xfff2bc94),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home", style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("Categories", style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text("Favorites", style: TextStyle(color: Colors.grey)),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile", style: TextStyle(color: Colors.grey)),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }

  //bottom navigation bar functionality
  Widget getCurrentTopWidget(){
    if(_selectedIndex == 0){
      return homeTopWidget();
    }else if(_selectedIndex == 1){
      return categoriesTopWidget();
    }else if(_selectedIndex == 2){
      return favoritesTopWidget();
    }else if(_selectedIndex == 3){
      return profileTopWidget();
    }else{
      return Container(child: Text("Selected Widget Error."),);
    }
  }

  Widget homeTopWidget(){
    return Container(
      height: getHeightPercentageInPixels(16),
      child: Column(
        children: [
          Container(
            height: getHeightPercentageInPixels(13.5),
            color: Color(0xfff2bc94),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container( //inside white box
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.white,
                    ),
                    child: Row( //search bar
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.black,
                          size: 50,
                        ),
                        Expanded(
                          child: TextFormField(
                            decoration: new InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                contentPadding:
                                EdgeInsets.only(
                                    left: 15, bottom: 11, top: 11, right: 15),
                                hintText: "Search for reservable establishments "),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Showing Locations for " + ZIPCODE.toString()),
              Icon(
                Icons.edit,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  var topWidgetNames = ["Categories","Favorites","Profile"];
  var topWidgetIcons = [Icons.category,Icons.star_border,Icons.person];



  Widget categoriesTopWidget(){
    return Container(
        height: getHeightPercentageInPixels(16),
      child: Column(
        children: [
          Container(
            color: Color(0xfff2bc94),
            padding: EdgeInsets.all(5),
            height: getHeightPercentageInPixels(13.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: getHeightPercentageInPixels(6),
                ),
                Padding(
                  padding: EdgeInsets.all(getWidthPercentageInPixels(8)),
                ),
                Icon(
                  Icons.category,
                  size: getHeightPercentageInPixels(6),
                ),
                Text("Categories",style: TextStyle(fontSize: getHeightPercentageInPixels(5)),),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Showing Locations for " + ZIPCODE.toString()),
              Icon(
                Icons.edit,
                color: Colors.black,
                size: 15,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget favoritesTopWidget(){
    return Container(
      height: getHeightPercentageInPixels(16),
      child: Column(
        children: [
          Container(
            color: Color(0xfff2bc94),
            padding: EdgeInsets.all(5),
            height: getHeightPercentageInPixels(13.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: getHeightPercentageInPixels(6),
                ),
                Padding(
                  padding: EdgeInsets.all(getWidthPercentageInPixels(8)),
                ),
                Icon(
                  Icons.star_border,
                  size: getHeightPercentageInPixels(6),
                ),
                Text("Favorites",style: TextStyle(fontSize: getHeightPercentageInPixels(5)),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget profileTopWidget(){
    return Container(
      height: getHeightPercentageInPixels(16),
      child: Column(
        children: [
          Container(
            color: Color(0xfff2bc94),
            padding: EdgeInsets.all(5),
            height: getHeightPercentageInPixels(13.5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: getHeightPercentageInPixels(6),
                ),
                Padding(
                  padding: EdgeInsets.all(getWidthPercentageInPixels(8)),
                ),
                Icon(
                  Icons.person,
                  size: getHeightPercentageInPixels(6),
                ),
                Text("Profile",style: TextStyle(fontSize: getHeightPercentageInPixels(5)),),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCurrentMainWidget(){
    if(_selectedIndex == 0){
      return homeMainWidget();
    }else if(_selectedIndex == 1){
      return categoriesMainWidget();
    }else if(_selectedIndex == 2){
      return homeMainWidget();//placeholder for now will be favorites later
    }else if(_selectedIndex == 3){
      return profileMainWidget();
    }else{
      return Container(child: Text("Selected Widget Error."),);
    }
  }

  int _selectedIndex = 0;

  //WHEN THE BOTTOM NAVIGATION BAR IS TAPPED THIS HAPPENS
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  var establishmentPlaceholder = ['Establishment 1','Establishment 2','Establishment 3','Establishment 4','Establishment 5'];

  //different widgets for different scenes
  Widget homeMainWidget(){
    return Container(
      //color: Colors.lightBlue,//temporary for bug testing
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: getHeightPercentageInPixels(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                    size: 50,
                  ),
                  Padding(padding: EdgeInsets.all(getWidthPercentageInPixels(2)),),
                  Text(establishmentPlaceholder[index],
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: establishmentPlaceholder.length,
      ),
    );
  }

  var categories = ["Restaurant", "Fitness Centers","Barbershop/Salons","Theaters","Hotels/Motels","Other"];
  var categoryIcons = [Icons.restaurant,Icons.fitness_center,Icons.content_cut,Icons.theaters,Icons.hotel,Icons.more_horiz];

  Widget categoriesMainWidget(){
    return Container(
      child: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              child: Row(
                children: [
                  Icon(categoryIcons[index],size: getHeightPercentageInPixels(6),),
                  Text(categories[index],style: TextStyle(fontSize: getHeightPercentageInPixels(5)),),
                ],
              ),
            ),
            onTap: () {
              //Go to the next screen with Navigator.push
              print(categories[index]+" was clicked.");
            },
          );
        },
      ),
    );
  }

  Widget profileMainWidget(){
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                Icons.person,
                size: getHeightPercentageInPixels(15),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Eric Lin",style: TextStyle(fontSize: getHeightPercentageInPixels(4)),),
                  Text("Bellevue, WA"),
                ],
              ),
            ],
          ),
          SizedBox(
            width: getWidthPercentageInPixels(80),
            height: getHeightPercentageInPixels(5),
            child: RaisedButton(
              child: Text("Edit Profile"),
              onPressed: (){
                print("Edit Profile button pressed");
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5),
          ),
          Row(
            children: [
              Text("Current Reservations", style: TextStyle(fontSize: getHeightPercentageInPixels(3)),),
              CustomPaint(
                size: Size(getWidthPercentageInPixels(53),
                    getHeightPercentageInPixels(2)),
                painter: LinePainter(),
              ),
            ],
          ),
          Container(
            
            height: getHeightPercentageInPixels(20),
            child: ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: getHeightPercentageInPixels(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: Colors.black,
                          size: 50,
                        ),
                        Padding(padding: EdgeInsets.all(getWidthPercentageInPixels(2)),),
                        Text(currentReservations[index],
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: currentReservations.length,
            ),
          ),
        ],
      ),
    );
  }

  var currentReservations = ["Establishment 1"];


  /* //placeholder for item layout in listview
  Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: getHeightPercentageInPixels(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                    size: 50,
                  ),
                  Padding(padding: EdgeInsets.all(getWidthPercentageInPixels(2)),),
                  Text("Establishment 1",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
          Padding(padding: EdgeInsets.all(5),),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              padding: EdgeInsets.all(10),
              height: getHeightPercentageInPixels(10),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: Colors.grey,
                  borderRadius: BorderRadius.all(Radius.circular(20))
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.add_a_photo,
                    color: Colors.black,
                    size: 50,
                  ),
                  Padding(padding: EdgeInsets.all(getWidthPercentageInPixels(2)),),
                  Text("Establishment 1",
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
            ),
          ),
   */

  //helper functions
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