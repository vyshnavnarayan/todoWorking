import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:very_good_app/homescreen/repository/manage_task_repo.dart';
import 'package:very_good_app/homescreen/view/add_Task.dart';
import 'package:very_good_app/profile/view/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final taskCollection = FirebaseFirestore.instance.collection('Tasks');
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProfilePage(),
                    ));
              },
              icon: Icon(Icons.person))
        ],
      ),
      body: StreamBuilder(
        stream: taskCollection
            .where('user_id', isEqualTo: auth.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data!.docs);
            final taskData = snapshot.data!.docs;
            return ListView.builder(
              itemCount: taskData.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(taskData[index]['task_name'].toString()),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(taskData[index]['description'].toString()),
                      Text(taskData[index]['date'].toString())
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => taskModal(
                                isUpdate: true,
                                name: taskData[index]['task_name'].toString(),
                                description: taskData[index]['description'].toString(),
                                task_id: taskData[index]['task_id'].toString()
                              ),
                            );
                          },
                          icon: Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {
                            ManageTaskRepo().deleteTask(
                                taskData[index]['task_id'].toString());
                          },
                          icon: Icon(Icons.delete))
                    ],
                  ),
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => taskModal(isUpdate: false),
            );
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.blue),
    );
  }
}
