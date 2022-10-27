import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlemap/utils/colors.dart';
class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      
      child: Scaffold(
        // appBar: AppBar(title: Text("Photos")),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection("user")
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .collection("History")
              .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
              return new Text('Error: ${snapshot.error}');
            }
            else{
              return  Container(
                height: 350,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) => 
                   Padding(
                     padding: const EdgeInsets.symmetric(horizontal:8.0),
                     child: GridView.count(crossAxisCount: 2,
                     semanticChildCount: snapshot.data!.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  // scrollDirection: Axis.vertical,
                  children: [
                      Container( height: 40,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          
                          decoration:BoxDecoration(color:Colors.black ,borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(image: NetworkImage(snapshot.data!.docs[index].get("url"),),fit: BoxFit.cover)
                        ),
                        ),
                      ),
                      
                      )
                  ],
                  ),
                   ),
                ),
              );
            }
              },
        )
      ),
    );
  }
}