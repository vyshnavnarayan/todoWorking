import 'package:flutter/material.dart';
import 'package:very_good_app/login/view/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  changeScreen() {
    Future.delayed(const Duration(seconds: 6), () {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),);
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            height: 20,
          ),
          Align(
            child: Image.network(
              // 'https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
              'https://i.stack.imgur.com/laUmp.png',
              // fit: BoxFit,
            ),
          ),
          const Text(
            '@redRoots',
            style: TextStyle(color: Colors.white38, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
