import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_flutter/game/game.dart';
import 'package:game_flutter/home/controllers/providers.dart';

import '../auth/providers/auth_provider.dart';
import '../generated/l10n.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // first variable is to get the data of Authenticated User
    final data = ref.watch(fireBaseAuthProvider);
    final auth = ref.watch(authenticationProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("${S.of(context).homeUserTitle} ${data.currentUser!.email}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S.of(context).homeGameTitle),
            ),
            RowOfHeroes(),
            StartGameButtonWidget(),
            Container(
              padding: const EdgeInsets.only(top: 48.0),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              child: MaterialButton(
                onPressed: () => auth.signOut(),
                textColor: Colors.blue.shade700,
                textTheme: ButtonTextTheme.primary,
                minWidth: 100,
                padding: const EdgeInsets.all(18),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Colors.blue.shade700),
                ),
                child: const Text(
                  'Log Out',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class StartGameButtonWidget extends ConsumerWidget {
  const StartGameButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final selectedStatus = ref.watch(selectedStatusProvider);
    return   Container(
      padding: const EdgeInsets.only(top: 48.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const GamePage()),
          );
        },
        textColor: Colors.blue.shade700,
        textTheme: ButtonTextTheme.primary,
        minWidth: 100,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.blue.shade700),
        ),
        child:  Text(
          'Start game ${selectedStatus.type}',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}


class RowOfHeroes extends ConsumerWidget {
  const RowOfHeroes({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context, WidgetRef ref){
    final heroes = ref.watch(heroProvider);
    return   Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {

            ref.read(heroProvider.notifier).toggle(heroes[0].id);
            ref.read(selectedStatusProvider.notifier).toggle(heroes[0].type);
          },
          child: Container(
            decoration: heroes[0].selected ? selectedHeroStyle: unSelectedHeroStyle,
            child: Column(
              children: [
                Text(heroes[0].description),
                Text(heroes[0].id),
                Text(heroes[0].selected.toString()),
              ],
            ),
          ),
        ),

        GestureDetector(
          onTap: () {
            ref.read(heroProvider.notifier).toggle(heroes[1].id);
            ref.read(selectedStatusProvider.notifier).toggle(heroes[1].type);
          },
          child: Container(
            decoration: heroes[1].selected ? selectedHeroStyle: unSelectedHeroStyle,
            child: Column(
              children: [
                Text(heroes[1].description),
                Text(heroes[1].id),
                Text(heroes[1].selected.toString()),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final BoxDecoration selectedHeroStyle = BoxDecoration(
  //borderRadius: BorderRadius.circular(6),
  color: Colors.amber.withOpacity(.5),

);

final BoxDecoration unSelectedHeroStyle = BoxDecoration(
  //borderRadius: BorderRadius.circular(6),
  color: Colors.greenAccent.withOpacity(.5),

);