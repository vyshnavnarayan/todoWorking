import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo/homescreen/view/homeScreen.dart';
import 'package:todo/signup/signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _password = TextEditingController();
final  _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.deepPurple.shade900,
          Colors.orange.shade600,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    Text(
                      'Welcome back',
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: Container(
                    height: 200,
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
                      padding: EdgeInsets.all(20),
                      child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30,
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
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value!)) {
                                            return 'Enter a valid Email';
                                          }
                                        },
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            hintText: 'Email or Phone number',
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(10),
                                      // decoration: BoxDecoration(
                                      //     border: Border(
                                      //         bottom:
                                      //             BorderSide(color: Colors.grey))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty){
                                            return 'Please enter your password';
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
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              TextButton(onPressed: () {
                                
                              },
                                child: Text('Forgot Password')),
                              //   'Forgot Password',
                              //   style: TextStyle(color: Colors.grey),
                              // )
                              SizedBox(height: 15),
                              InkWell(
                                onTap: () async {
                                  if(_formKey.currentState!.validate()){
                                  try {
                                    final _auth = FirebaseAuth.instance;
                                    final userRef =
                                        await _auth.signInWithEmailAndPassword(
                                            email: _emailController.text,
                                            password: _password.text);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(),
                                        ));
                                  } catch (e) {
                                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('Invalid Email or Password')));
                                  }
                                  }
                                },
                                child: Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.orange),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              ),
                              SizedBox(height: 5),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignupPage(),
                                      ));
                                },
                                child: Container(
                                    height: 50,
                                    margin: EdgeInsets.symmetric(horizontal: 50),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: Colors.deepPurple),
                                    child: Center(
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}
