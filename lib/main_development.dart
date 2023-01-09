import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:todo/app/app.dart';
import 'package:todo/bootstrap.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  bootstrap(() => const App());
}
