import 'package:flutter/material.dart';

void main() => runApp(MyApp());

enum SpecialContainerType { customers, products, revenue, statistics }
enum BottomNav { home, clock, notification, profile }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1a1830),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15),
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffb43af7),
                    Color(0xff6d2af7),
                  ],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Hello Amazigh!",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          "https://c10.patreonusercontent.com/3/eyJ3IjoyMDB9/patreon-media/p/campaign/2895569/4f7a92f58e6740438a5988189a0b8e3b/1.png?token-time=2145916800&token-hash=6OaOR40De5xhunONrhD2wHILZexccfkBPki238oHc8M%3D",
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Text(
                    "Today Sales",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "\$",
                          style: TextStyle(fontSize: 13.0, color: Colors.white),
                        ),
                        TextSpan(
                          text: "1395.21",
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Container(
                    height: 50,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        FlatButton(
                          child: Text(
                            "My Account",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            "Orders",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                        FlatButton(
                          child: Text(
                            "TRANSACTIONS",
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: GridView.count(
                  crossAxisCount: 2,
                  children: <Widget>[
                    SpecialContainer(SpecialContainerType.customers),
                    SpecialContainer(SpecialContainerType.products),
                    SpecialContainer(SpecialContainerType.revenue),
                    SpecialContainer(SpecialContainerType.statistics),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 11),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 9),
                decoration: BoxDecoration(
                  color: Colors.white30,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    BottomNavigationItem(
                      type: BottomNav.home,
                      isActive: true,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.clock,
                      isActive: false,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.notification,
                      isActive: false,
                    ),
                    BottomNavigationItem(
                      type: BottomNav.profile,
                      isActive: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationItem extends StatelessWidget {
  final type;
  final bool isActive;
  const BottomNavigationItem({Key key, this.type, this.isActive})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (type) {
      case BottomNav.home:
        icon = Icons.home;
        break;
      case BottomNav.clock:
        icon = Icons.timelapse;
        break;
      case BottomNav.notification:
        icon = Icons.notifications;
        break;
      case BottomNav.profile:
        icon = Icons.person;
        break;
    }
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(9),
        gradient: isActive
            ? LinearGradient(
                colors: [
                  Color(0xffb43af7),
                  Color(0xff6d2af7),
                ],
              )
            : null,
      ),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}

class SpecialContainer extends StatelessWidget {
  final type;
  SpecialContainer(this.type);
  @override
  Widget build(BuildContext context) {
    String containerText, containerImage;
    Color color;
    switch (type) {
      case SpecialContainerType.customers:
        containerText = "Customers";
        containerImage = "assets/people.png";
        color = Colors.blue;
        break;
      case SpecialContainerType.products:
        containerText = "Products";
        containerImage = "assets/box.png";
        color = Colors.orange;
        break;
      case SpecialContainerType.revenue:
        containerText = "Revenue";
        containerImage = "assets/revenue.png";
        color = Colors.green;
        break;
      case SpecialContainerType.statistics:
        containerText = "Statistics";
        containerImage = "assets/statistics.png";
        color = Colors.redAccent;
        break;
    }
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white24,
                      offset: Offset(0, 5),
                      blurRadius: 5.0,
                    ),
                  ],
                ),
                child: CircleAvatar(
                  // backgroundImage: AssetImage(containerImage,),
                  child: Container(
                    width: 31,
                    height: 31,
                    child: Image.asset(containerImage,),
                  ),
                  backgroundColor: color,
                  radius: 25,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "$containerText",
                    style: TextStyle(color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
