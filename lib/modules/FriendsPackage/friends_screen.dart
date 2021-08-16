import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:together/ChatPackage/chat_screen.dart';
import 'package:together/PersonProfilePackage/person_profile.dart';
import 'package:together/constatPackage/friends.dart';

class FriendsScreen extends StatefulWidget {
  const FriendsScreen({Key? key}) : super(key: key);

  @override
  _FriendsScreenState createState() => _FriendsScreenState();
}

class _FriendsScreenState extends State<FriendsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          itemCount: Friends.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                  color: Color(0xff300a6a),
                  border: Border.all(color: Color(0xFFEEEEEE)),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));

                      },
                      child: Container(

                        color: Colors.white,
                        child: ListTile(
                          leading: Friends[index]['story'] > 0
                              ? Stack(
                                  children: [

                                    Container(
                                      width: 65,
                                      height: 65,
                                      padding: EdgeInsets.all(1),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(color :Color(0xff384dfd),width: 2),
                                      ),
                                      child: Container(
                                        width: 65,
                                        height: 65,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image:
                                                  NetworkImage(Friends[index]["image"]),
                                            )),
                                      ),
                                    ),
                                  ],
                                )
                              : Container(
                                  width: 65,
                                  height: 65,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(Friends[index]["image"]),
                                      )),
                                ),
                          title: Text(
                            Friends[index]["name"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(Friends[index]["status"]),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PersonProfile()));

                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: IconButton(
                          onPressed: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PersonProfile()));

                          },
                          icon: Icon(
                            EvaIcons.person,
                            color: Colors.white,
                          ),

                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
