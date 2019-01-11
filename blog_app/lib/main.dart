import 'package:blog_app/HomePage.dart';
import 'package:blog_app/LoginRegisterPage.dart';
import 'package:flutter/material.dart';
import 'Mapping.dart';
import 'Authentication.dart';

void main() {
  runApp(new BlogApp());
}

class BlogApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Blog App",
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
    
    home: MappingPage(
      auth: Auth(),
    ),
    );
  }
}
