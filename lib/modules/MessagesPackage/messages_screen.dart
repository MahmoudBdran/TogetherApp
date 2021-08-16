import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:together/ChatPackage/chat_screen.dart';
import 'package:together/constatPackage/constants.dart';
import 'package:together/constatPackage/friends.dart';
import 'package:together/constatPackage/messages.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: MediaQuery.of(context).size.height,
      child:ListView(
        children: [
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 10.0),
              Container(
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 6.0,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                height: 45.0,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'OpenSans',
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 8.0, top: 10.0),
                    hintText: 'Search...',
                    hintStyle: kHintTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),

          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5,0,5,10),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage(
                                        Users[0]['image']),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff300a6a),
                                  shape: BoxShape.circle,
                                  border:
                                  Border.all(color: Colors.white, width: 3)),
                              child: Icon(Icons.add,color:Colors.white,size: 15,),
                            ),
                          )

                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 75,
                        child: Align(
                            child: Text(
                              'Your Story',
                              overflow: TextOverflow.ellipsis,
                            )),
                      )
                    ],
                  ),
                ),
                Row(
                    children: List.generate(Friends.length, (index) {

                      return Padding(
                        padding: const EdgeInsets.fromLTRB(5,10,5,5),
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: 60,
                              height: 60,
                              child: Stack(
                                children: <Widget>[
                                  Friends[index]['story']>0
                                      ? Container(
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Colors.blueAccent, width: 3)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    Friends[index]['image']),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                  )
                                      : Container(
                                    width: 55,
                                    height: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image:
                                            NetworkImage(Friends[index]['image']),
                                            fit: BoxFit.cover)),
                                  ),
                                  Friends[index]['online']
                                      ? Positioned(
                                    bottom: 0,
                                    right: 4,
                                    child: Container(
                                      width: 15,
                                      height: 15,
                                      decoration: BoxDecoration(
                                          color: Colors.green,
                                          shape: BoxShape.circle,
                                          border:
                                          Border.all(color: Colors.white, width: 3)),
                                    ),
                                  )
                                      : Container()
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: 75,
                              child: Align(alignment: Alignment.center,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left:6.0),
                                    child: Friends[index]['name'].length<14?
                                    Text(
                                      Friends[index]['name'],
                                      overflow: TextOverflow.fade,
                                    ):
                                    Text(
                                      Friends[index]['name'].toString().substring(0,12)+"...",
                                      overflow: TextOverflow.fade,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      );
                    }
                    )),
              ],
            ),
          ),

          Column(
            children: List.generate(userMessages.length, (index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.15,
                secondaryActions: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: new IconSlideAction(
                  //     caption: 'More',
                  //     color: Colors.black45,
                  //     icon: Icons.more_horiz,
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              userMessages.removeAt(index);
                            });
                          },
                        )),
                  ),
                ],
                child: InkWell(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChatScreen()));
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFEEEEEE)),
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: ListTile(
                      leading: userMessages[index]['online'] == true
                          ? Stack(
                        children: [
                          Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      userMessages[index]["img"]),
                                )),
                          ),
                          Positioned(
                            bottom: 4,
                            right: 8,
                            child: Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff26ff00))),
                          )
                        ],
                      )
                          : Container(
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  userMessages[index]["img"]),
                            )),
                      ),
                      title: Text(
                        userMessages[index]["name"],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(userMessages[index]["message"]),
                      trailing: Text(userMessages[index]["created_at"]),
                    ),
                  ),
                ),
              );
            }),
          )
        ],
      )


    );
  }
}

// ListView.builder(
//   scrollDirection: Axis.horizontal,
//     itemCount: Friends.length,
//     itemBuilder: (context,index){
//   return Container(
//     height: 200,
//     width: MediaQuery.of(context).size.width,
//     decoration: BoxDecoration(
//       shape: BoxShape.circle,
//       image: DecorationImage(
//         image: NetworkImage(Friends[index]['image']),
//         fit: BoxFit.cover
//       )
//     ),
//   );
// }),

/*
Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(25.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 6.0,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  height: 50.0,
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'OpenSans',
                    ),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8.0, top: 14.0),
                      hintText: 'Search...',
                      hintStyle: kHintTextStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
 */
/*
ListView.builder(
              itemCount: userMessages.length,
              itemBuilder: (context, index) {
                return Slidable(
                  actionPane: SlidableDrawerActionPane(),
                  actionExtentRatio: 0.15,
                  secondaryActions: <Widget>[
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: new IconSlideAction(
                    //     caption: 'More',
                    //     color: Colors.black45,
                    //     icon: Icons.more_horiz,
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          child: IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                userMessages.removeAt(index);
                              });
                            },
                          )),
                    ),
                  ],
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()));
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Color(0xFFEEEEEE)),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: ListTile(
                        leading: userMessages[index]['online'] == true
                            ? Stack(
                                children: [
                                  Container(
                                    width: 65,
                                    height: 65,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              userMessages[index]["img"]),
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 4,
                                    right: 8,
                                    child: Container(
                                        width: 10,
                                        height: 10,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Color(0xff26ff00))),
                                  )
                                ],
                              )
                            : Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          userMessages[index]["img"]),
                                    )),
                              ),
                        title: Text(
                          userMessages[index]["name"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(userMessages[index]["message"]),
                        trailing: Text(userMessages[index]["created_at"]),
                      ),
                    ),
                  ),
                );
              }),
 */


/*
Row(
              children: List.generate(userStories.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Column(
                children: <Widget>[
                  Container(
                    width: 75,
                    height: 75,
                    child: Stack(
                      children: <Widget>[
                        userStories[index]['story']
                            ? Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: blue_story, width: 3)),
                                child: Padding(
                                  padding: const EdgeInsets.all(3.0),
                                  child: Container(
                                    width: 75,
                                    height: 75,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                userStories[index]['img']),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                              )
                            : Container(
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(userStories[index]['img']),
                                        fit: BoxFit.cover)),
                              ),
                        userStories[index]['online']
                            ? Positioned(
                                top: 48,
                                left: 52,
                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: BoxDecoration(
                                      color: online,
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: white, width: 3)),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 75,
                    child: Align(
                        child: Text(
                      userStories[index]['name'],
                      overflow: TextOverflow.ellipsis,
                    )),
                  )
                ],
              ),
            );
          }
          ))
            ],
          ),
        ),
 */
