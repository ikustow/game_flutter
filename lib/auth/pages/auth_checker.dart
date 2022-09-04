import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import 'error_screen.dart';
import '../../home/home_page.dart';
import 'loading_screen.dart';
import 'login_page.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({Key? key}) : super(key: key);

  //  Notice here we aren't using stateless/statefull widget. Instead we are using
  //  a custom widget that is a consumer of the state.
  //  So if any data changes in the state, the widget will be updated.

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //  now the build method takes a new paramaeter ScopeReader.
    //  this object will be used to access the provider.

    //  now the following variable contains an asyncValue so now we can use .when method
    //  to imply the condition
    final authState = ref.watch(authStateProvider);
    return authState.when(
        data: (data) {
          if (data != null) return  HomePage();
          return  LoginPage();
        },
        loading: () => const LoadingScreen(),
        error: (e, trace) => ErrorScreen(e, trace));
  }
}