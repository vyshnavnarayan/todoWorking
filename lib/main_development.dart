import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'app/view/app.dart';
import 'bootstrap.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
  bootstrap(() => const App());
}
