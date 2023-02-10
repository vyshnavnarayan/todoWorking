import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:very_good_app/profile/profile_reppo/profile_reppo.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('usercollection');

  final _auth = FirebaseAuth.instance;

  Future<void> getImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    await ManageProfile().updateProfile(image!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: FutureBuilder(
        future: _userCollection.doc(_auth.currentUser!.uid).get(),
        builder: (BuildContext context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!;
            return Column(
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: getImage,
                  child: CircleAvatar(
                    backgroundColor: Colors.blue,
                    // backgroundImage: NetworkImage(
                    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVA_HrQLjkHiJ2Ag5RGuwbFeDKRLfldnDasw&usqp=CAU'),
                    radius: 50,
                    child: userData['Profile_image'] == ''
                        ? Text(userData['Username'][0].toString(),
                            style: TextStyle(fontSize: 50))
                        : ClipOval(
                          
                          child: Image.network(userData['Profile_image'].toString(),
                          fit: BoxFit.cover,
                          width: 200,

                          ),
                        ),
                  ),
                ),
                Text(
                  userData['Username'].toString(),
                  style: TextStyle(fontSize: 20),
                ),
                TextButton(onPressed: () {}, child: Text('Edit')),
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(height: 1),
                      Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 5)),
                      Text(
                        'Account',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80)),
                                  Text(
                                    userData['Phone'].toString(),
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 80)),
                                  Text(
                                    userData['Username'].toString(),
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
                              border: Border(
                                  bottom: BorderSide(color: Colors.grey))),
                          width: MediaQuery.of(context).size.width,
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
                                    userData['Email'].toString(),
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
                TextButton(onPressed: () {}, child: Text('Log out'))
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
