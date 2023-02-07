

import 'package:flutter/material.dart';
import 'package:todo/login/login.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
    });
    }

  @override
  void initState(){
    changeScreen();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 20,),
          Align(child: Icon(Icons.shopping_bag,size: 40,)),
          Text('Meta')
        ],
      )
      
    );
  }
}