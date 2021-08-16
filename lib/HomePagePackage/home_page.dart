import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:together/constatPackage/friends.dart';
import 'package:together/modules/FriendsPackage/friends_screen.dart';
import 'package:together/modules/MessagesPackage/messages_screen.dart';
import 'package:together/modules/SettingsScreen/settings_screen.dart';
import 'package:together/profilePackage/profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;
  List<Widget> screens = [MessagesScreen(), FriendsScreen(), SettingsScreen()];
  List<String> titles = ['Messages', 'Friends'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xff300a6a),
      key: scaffoldKey,
      appBar: AppBar(leading: IconButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));}, color:Colors.grey,icon: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: NetworkImage(Users[0]['image']),
                fit: BoxFit.cover
            )
        ),
      )),
        backgroundColor: Color(0xff300a6a),
        title: Text(titles[currentIndex],style: TextStyle(
          fontWeight: FontWeight.bold,
        ),),
        actions: [Container(
          height: 40,
          width: 40,
          decoration:BoxDecoration(
              shape:BoxShape.circle,
              color: Color(0xff190f52)
          ),
          child: IconButton(
            icon:Icon(Icons.camera_alt),
            iconSize: 20,
            color:Colors.white,
            onPressed: (){

            },
          ),
        ),
          
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            color: Color(0xFFEEEEEE),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0),
                topRight: Radius.circular(0),
                bottomLeft: Radius.circular(45),
                bottomRight: Radius.circular(45))),
        child: screens[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        backgroundColor: Color(0xff300a6a),
        items: [
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.messageCircle), label: "messages"),
          BottomNavigationBarItem(
              icon: Icon(EvaIcons.people), label: "Friends"),
        ],
      ),
    );
  }
}
