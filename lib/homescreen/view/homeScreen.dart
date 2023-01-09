import 'package:flutter/material.dart';
import 'package:todo/homescreen/view/add_Task.dart';
import 'package:todo/profile/view/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
        actions: [IconButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage(),));
        }, icon: Icon(Icons.person))],
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('WELCOME HOME',style: TextStyle(fontStyle: FontStyle.italic, color: Colors.black),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(context: context, builder: (context) => taskModal(),);
      },child: Icon(Icons.add),backgroundColor:Colors.blue),
    );
  }

 
}