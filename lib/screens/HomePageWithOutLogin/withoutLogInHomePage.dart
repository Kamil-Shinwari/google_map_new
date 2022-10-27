import 'package:flutter/material.dart';
import 'package:googlemap/screens/login.dart';
import 'package:googlemap/screens/signup.dart';

class WithOutLogInHomeScreen extends StatefulWidget {
  const WithOutLogInHomeScreen({super.key});

  @override
  State<WithOutLogInHomeScreen> createState() => _WithOutLogInHomeScreenState();
}

class _WithOutLogInHomeScreenState extends State<WithOutLogInHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SizedBox(
          height: 30,
        ),
        Container(
          width: double.infinity,
          color: Colors.black,
          height: 50,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
            child: Text(
              "Home",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
        ),
        Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/path.jpg"),
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.3), BlendMode.darken),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(15)),
                    child: Icon(Icons.search,size: 55,color: Colors.white,),
                                ),
                                 SizedBox(height: 10,),
                Text("Record a Ride",style: TextStyle(fontSize: 22),),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Container(
                    width: 150,
                    height: 200,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/path2.jpg"),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.3), BlendMode.darken)),
                    borderRadius: BorderRadius.circular(15)),
                    
                  ),
                  SizedBox(height: 10,),
                 Text("Explore Routes",style: TextStyle(fontSize: 22),), 
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          
          child: Text("Gain Access",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
        ),
        Card(child: Container(height: 70,child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text("Log into Sync Your rides, see your ,\n stats enable sharing and more "),
            ),
            CircleAvatar(child: Icon(Icons.person,color: Colors.white,size: 40,))
        ]),)),


             Card(child: Container(height: 70,child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                },
                child: Text("Sign In",style: TextStyle(color: Colors.deepOrange,fontSize: 20),)),
            ),
            SizedBox(width: 15,),
           InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
            },
            child: Text("Log In",style: TextStyle(color: Colors.deepOrange,fontSize: 20),)),
        ]),)),

         SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.only(left:8.0),
          
          child: Text("Open Shortcut",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),

        ),
        Card(child: Container(height: 70,child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left:15.0),
              child: Text("use shortcut to access a shareed,\n tour , event , or route "),
            ),
            CircleAvatar(child: Icon(Icons.qr_code,size: 40,))
        ]),)),
      ]),
    );
  }
}
