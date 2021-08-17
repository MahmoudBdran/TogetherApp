import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:together/constatPackage/friends.dart';

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  FirebaseAuth auth=FirebaseAuth.instance;
  CollectionReference userInfo=FirebaseFirestore.instance.collection("users");
  
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
        child: FutureBuilder(
            future: userInfo.doc(auth.currentUser!.uid).get(),
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if(snapshot.hasData){
              // Map<String, dynamic>? data = snapshot.data!.data() as Map<String, dynamic>?;
              // return Text("Full Name: ${data?['username']} ${data?['email']}");
              //print(snapshot.data!['username']);
              return ListView(
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
                                image: NetworkImage(snapshot.data!['avatar']),
                                fit: BoxFit.cover,
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(snapshot.data!['username'],style: TextStyle(
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
              );
            }else{
              return CircularProgressIndicator();
            }
          }
        ),
      ),
    );
  }
}
