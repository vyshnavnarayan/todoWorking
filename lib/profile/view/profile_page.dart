import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: 
      SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: 170,
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey))),
                child: Center(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU'),
                      radius: 50,
                    ),
                    Text(
                      'Your Name',
                      style: TextStyle(fontSize: 20),
                    ),
                    Container(
                    decoration: BoxDecoration(
                      color: Colors.blue.shade500,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(height: 1),
                        Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 5, vertical: 5)),
                            Text(
                              'Account',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            width: MediaQuery.of(context).size.width,
                            height: 80,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 80)),
                                    Text(
                                      '+91 0123456789',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text('Tap to change phone number',
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 80)),
                                    Text(
                                      'User name',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text('Tap to change username',
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.shade100,
                                border: Border(
                                    bottom: BorderSide(color: Colors.grey))),
                            width: MediaQuery.of(context).size.width,
                            height: 70,
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 100)),
                                    Text(
                                      'Bio',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    Text('Add a few words about yourself',
                                        style: TextStyle(fontSize: 10))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ],),
                )
                ),
          
    ],
        )
      ),
    );
  }
}
