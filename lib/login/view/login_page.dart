import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:very_good_app/homescreen/view/homeScreen.dart';
import 'package:very_good_app/login/bloc/login_bloc.dart';
import 'package:very_good_app/signup/view/signup_page.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final logBloc = LoginBloc();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => logBloc,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('Login failed')));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Login Screen'),
          ),
          body: SafeArea(
              child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              _loginform(),

              //* BUTTON BLOC
            ],
          )),
        ),
      ),
    );
  }

  Widget _loginform() => Expanded(
          child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value == null) {
                  return 'email cant be null';
                }
              },
              controller: _emailController,
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _password,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            const SizedBox(
              height: 15,
            ),
            RichText(
              text: TextSpan(
                  text: "don't have an account ?? ",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = gotoSignupScreen,
                      text: " Sign Up",
                      style: const TextStyle(
                        color: Colors.lightGreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ]),
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              textColor: Colors.white,
              color: Colors.blue,
              child: const Text('Login'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  logBloc.add(
                    UserLoginEvent(
                      email: _emailController.text,
                      password: _password.text,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ));

  void gotoSignupScreen() => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SignupPage()),
      );
}
