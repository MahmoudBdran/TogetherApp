import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonProfile extends StatefulWidget {
  const PersonProfile({Key? key}) : super(key: key);

  @override
  _PersonProfileState createState() => _PersonProfileState();
}

class _PersonProfileState extends State<PersonProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("profile"),),
    );
  }
}
