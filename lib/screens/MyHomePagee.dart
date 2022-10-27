import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:d_chart/d_chart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:googlemap/screens/provider/count_provider.dart';
import 'package:googlemap/screens/settings/Setting_screen.dart';
import 'package:googlemap/utils/colors.dart';
// import 'package:googlemap/screens/help_screen.dart';
import 'package:provider/provider.dart';

class MyHomePagee extends StatefulWidget {
  const MyHomePagee({super.key});

  @override
  State<MyHomePagee> createState() => _MyHomePageeState();
}

class _MyHomePageeState extends State<MyHomePagee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: StreamBuilder<QuerySnapshot>(
        //   stream: FirebaseFirestore.instance
        //       .collection("user")
        //       .doc(FirebaseAuth.instance.currentUser!.uid)
        //       .collection("History")
        //       .snapshots(),
        //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        //     if (snapshot.hasError) {
        //       return new Text('Error: ${snapshot.error}');
        //     }
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Center(
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: <Widget>[
        //             Text("Loading..."),
        //             SizedBox(
        //               height: 50.0,
        //             ),
        //             CircularProgressIndicator()
        //           ],
        //         ),
        //       );
        //     } else {
        //       return ListView.builder(
        //         itemCount: snapshot.data!.docs.length,
        //         itemBuilder: (_, index) {
        //           return Padding(
        //             padding: const EdgeInsets.all(10.0),
        //             child: Container(
        //               decoration: BoxDecoration(
        //                   border: Border.all(color: Colors.red, width: 1)),
        //               child: Padding(
        //                 padding: const EdgeInsets.all(8.0),
        //                 child: Row(children: [
        //                   Expanded(
        //                       child: Container(
        //                     height: 90,
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(20),
        //                         image: DecorationImage(
        //                             image: NetworkImage(
        //                                 snapshot.data!.docs[index]["url"]),
        //                             fit: BoxFit.cover)),
        //                   )),
        //                   SizedBox(
        //                     width: 10,
        //                   ),
        //                   Expanded(
        //                     flex: 2,
        //                       child: Container(
        //                     height: 90,
        //                     decoration: BoxDecoration(
        //                       borderRadius: BorderRadius.circular(20),

        //                     ),
        //                     child: Column(
        //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //                       children: [
        //                       Row(
        //                         children: [
        //                           Text("Title : ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        //                           Text(snapshot.data!.docs[index]["title"])
        //                         ],
        //                       ),
        //                       Row(
        //                         children: [
        //                           Text("Time Taken : ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                           Text(snapshot.data!.docs[index]["Time taken"])
        //                         ],
        //                       ),
        //                        Row(
        //                         children: [
        //                           Text("Distance : ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                           Text(snapshot.data!.docs[index]["Total Distance Covered"])
        //                         ],
        //                       ),
        //                        Row(
        //                         children: [
        //                           Text("Description : ",style: TextStyle(fontWeight: FontWeight.bold),),
        //                           Text(snapshot.data!.docs[index]["desc"])
        //                         ],
        //                       )
        //                     ]),
        //                   )),
        //                 ]),
        //               ),
        //             ),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50,
                color: Colors.black,
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "Home",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Last 30 Days ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    Container(
                      width: double.infinity,
                      height: 160,
                      color: Colors.red,
                      child: Text(
                        "Graph Will Show Here",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              "0.0",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Total Distance",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          children: [
                            Text(
                              "0.0",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              "Rides",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Card(
                        child: Container(
                      height: 100,
                      width: double.infinity,
                      child: Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 0.2,
                                                spreadRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.2))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/route.png"))),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Planner",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              // SizedBox(width: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 0.2,
                                                spreadRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.2))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  "assets/friends.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Friends",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 0.2,
                                                spreadRadius: 5,
                                                color: Colors.grey
                                                    .withOpacity(0.2))
                                          ],
                                          shape: BoxShape.circle,
                                          image: DecorationImage(
                                              image:
                                                  AssetImage("assets/qr.png"),
                                              fit: BoxFit.cover)),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Shortcut",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    )),
                  ],
                ),
              ),
              // Container(height: 250,color: Colors.red,)
              Text(
                "Your Rides History",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.height,
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection("user")
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection("History")
                      .snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) {
                      return CircularProgressIndicator();
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 10),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.red, width: 1)),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 3,
                                          child: Container(
                                            // color: Colors.red,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 8.0),
                                              child: Column(children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Title :",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    Text(snapshot
                                                        .data!.docs[index]
                                                        .get("title"))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Description :",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    Text(snapshot
                                                        .data!.docs[index]
                                                        .get("desc"))
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Distance :",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 14),
                                                    ),
                                                    Text(snapshot
                                                        .data!.docs[index]
                                                        .get(
                                                            "Total Distance Covered"))
                                                  ],
                                                ),
                                              ]),
                                            ),
                                          )),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 8.0, horizontal: 10),
                                            child: Container(
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                    snapshot.data!.docs[index]
                                                        .get("url"),
                                                        
                                                  ),fit: BoxFit.cover),
                                                  border: Border.all(
                                                      color: Colors.red,
                                                      width: 1),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                            )),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              )
            ]),
      ),
    ));
  }
}
