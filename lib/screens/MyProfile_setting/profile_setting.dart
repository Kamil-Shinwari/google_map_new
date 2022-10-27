import 'package:flutter/material.dart';
import 'package:googlemap/screens/MyProfile_setting/photos_page.dart';
import 'package:googlemap/screens/MyProfile_setting/profile_detail_page.dart';
import 'package:googlemap/screens/history.dart';
class MyProfileSetting extends StatefulWidget {
  const MyProfileSetting({super.key});

  @override
  State<MyProfileSetting> createState() => _MyProfileSettingState();
}

class _MyProfileSettingState extends State<MyProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
  length: 4,
  child: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.deepOrange,
      bottom: TabBar(
        tabs: [
          Tab(text: "Home",),
          Tab(text: "Rides",),
          Tab(text: "Routes",),
          Tab(text: "Photos",),
        ],
      ),
      title: Text('My Profile'),

      
      actions: [
       
        Icon(Icons.edit,size: 35,),
         Icon(Icons.more_vert,size: 35,),
        
      ],
    ),
    body: TabBarView(
      children: [
        ProfileDetailPage(),
        History(),
         ProfileDetailPage(),
          PhotosPage()
      ],
    ),
  ),
);
  }
}