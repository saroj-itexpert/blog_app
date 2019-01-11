import 'package:flutter/material.dart';
import 'Authentication.dart';


class HomePage extends StatefulWidget {
  HomePage({
    this.auth,
    this.onSignedOut,
  });

  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _logoutUser() async
  {
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    }catch(e){
      print(e.toString());
    }


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