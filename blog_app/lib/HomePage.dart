import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logoutUser(){

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),

      body: Container(

      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
                 IconButton(
                onPressed: _logoutUser,
                iconSize: 50.0,
                color: Colors.white,
                icon: Icon(Icons.local_car_wash),
              ),
              IconButton(
                onPressed: (){},
                iconSize: 50.0,
                color: Colors.white,
                icon: Icon(Icons.add_a_photo),
              ),
                IconButton(
                onPressed: (){},
                iconSize: 50.0,
                color: Colors.white,
                icon: Icon(Icons.person),
              )
            ],
          ),
        ),
      ),
    );
  }
}