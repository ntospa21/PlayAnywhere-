import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:play_anywhere/views/app.dart';

import 'package:user_repository/src/user_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(FirebaseUserRepo()));
}
