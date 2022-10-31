import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff157EFB).withOpacity(0.6),
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal:15.0.w),
          child: Column(children: [
            Row(children: [
              Expanded(child: Text("welcome ! We are  Happy that you are here ",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),)),
              
            ],),
            Divider(color: Colors.white,),
            Center(child: Text("How To Use",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),),)
          ]),
        ),
      ),
    );
  }
}