import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'auth/pages/auth_checker.dart';
import 'auth/pages/error_screen.dart';
import 'auth/pages/loading_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
/*
  if (Platform.isIOS) {
    if (Firebase.apps.isNotEmpty) {
      await Firebase.initializeApp();
      */
/*await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyAHjQpCho10o_MP15WDP5s1kqEyXcDa-QE<",
              appId: "1:837271975898:ios:8475cf0d1c7af4913b32e3",
              messagingSenderId: "837271975898",
              projectId: "game-949a6"));*//*

    } else {

    }
*/

    //
  
  await Firebase.initializeApp();
  runApp(ProviderScope(child: MyApp()));
}

/*//  This is a FutureProvider that will be used to check whether the firebase has been initialized or not
final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});*/

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

         home: AuthChecker()
    );
  }
}