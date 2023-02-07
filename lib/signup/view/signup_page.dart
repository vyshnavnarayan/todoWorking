import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/login/login.dart';
import 'package:todo/signup/bloc/signup_bloc.dart';
import 'package:todo/signup/repository/signup_repo.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _userName = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneNumber = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final signupBloc = SignupBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => signupBloc,
      child: BlocListener<SignupBloc, SignupState>(
        listener: (context, state) {
          // TODO: implement listener
          print(state);
          if(state is SignupSucess){
            Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),));
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SignUp failed')));
          }
        },
        child: Scaffold(
          body: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topCenter, colors: [
              Colors.deepPurple.shade900,
              Colors.orange.shade600,
            ])),
            child: ListView(
              // crossAxisAlignment: CrossAxisAlignment.start,
              shrinkWrap: true,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                  ),
                ),
                Container(
                    height: 500,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/wp.jpg"),
                            fit: BoxFit.cover),
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(225, 95, 27, .3),
                                        blurRadius: 20,
                                        offset: Offset(0, 20))
                                  ]),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "User Name can't be null";
                                          }
                                        },
                                        controller: _userName,
                                        decoration: InputDecoration(
                                            hintText: 'User Name',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (!RegExp(
                                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                              .hasMatch(value!)) {
                                            return "Email can't be null";
                                          }
                                        },
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Email ID',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.length != 10) {
                                            return "Please enter valid Phone Number";
                                          }
                                        },
                                        controller: _phoneNumber,
                                        decoration: InputDecoration(
                                            hintText: 'Phone Number',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "This field can't be empty";
                                          }
                                        },
                                        controller: _password,
                                        decoration: InputDecoration(
                                            hintText: 'Password',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(5),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please confirm your password";
                                          } else if (value != _password.text) {
                                            return "Incorrect password";
                                          }
                                        },
                                        controller: _confirmPassword,
                                        decoration: InputDecoration(
                                            hintText: 'Confirm Password',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                  onPressed: () async {
                                    // print(_userName.text);
                                    // print(_emailController.text);
                                    // print(_phoneNumber.text);
                                    // print(_password.text);
                                    // _emailController.clear();

                                    if (_formKey.currentState!.validate()) {
                                      print('valid');
                                      signupBloc.add(UserSignupEvent(
                                          email: _emailController.text,
                                          password: _password.text,
                                          name: _userName.text,
                                          phonenumber: _phoneNumber.text));
                                    }
                                  },
                                  child: Text('SignUp')),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(),
                                      ));
                                },
                                child: Text('Login'))
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
