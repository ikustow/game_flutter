import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'auth/pages/auth_checker.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
    //

  await Firebase.initializeApp();
  runApp(const ProviderScope(child: MyApp()));
}


class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return const MaterialApp(
      debugShowCheckedModeBanner: false,

         home: AuthChecker()
    );
  }
}