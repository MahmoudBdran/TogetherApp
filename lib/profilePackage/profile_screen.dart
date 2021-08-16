import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together/constatPackage/friends.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xff7b32ea),
      appBar:AppBar(
        title: Text("Profile"),
        backgroundColor:Color(0xff300a6a),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient:LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xff7b32ea),
              Color(0xff760097),
            ],
          )
        ),
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(Users[0]['image']),
                        fit: BoxFit.cover,
                      )
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Text(Users[0]['name'],style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Colors.white
                ),)
              ],
            ),
            SizedBox(height: 20,),
            Column(
              children: [
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          color: Colors.black38,
                          shape: BoxShape.circle
                      ),child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.dark_mode,color: Colors.white,),
                      )),
                  title: Text("Dark Mode",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),),
                  subtitle: Text("Off",style: TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.w600
                  ),),
                ),
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff5009b),
                          shape: BoxShape.circle
                      ),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.switch_account,color: Colors.white,),
                  )),
                  title: Text("Switch Account",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),),
                  trailing: Container(

                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("2",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),
                ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          color: Color(0xfff5009b),
                          shape: BoxShape.circle
                      ),child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(EvaIcons.messageCircle,color: Colors.white,),
                  )),
                  title: Text("Message Requests",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w700
                  ),),
                  trailing: Container(

                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,

                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("15",style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500
                      ),),
                    ),
                  ),
                ),




              ],
            ),

          ],
        ),
      ),
    );
  }
}
