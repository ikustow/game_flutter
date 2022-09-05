import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/game/controllers/providers.dart';
import 'package:game_flutter/game/model/logger.dart';

class GamePage extends ConsumerWidget {
  const GamePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Level 1"),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                PlayerWidget(),
                EnemyWidget(),
              ],
            ),
            AttackButtonWidget(),
            LoggerWidget(),
          ],
        ),
      ),
    );
  }
}

class PlayerWidget extends ConsumerWidget {
  const PlayerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider);
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(player.health.toString())
            ],
          ),
          Column(
            children: [
              const PlayerAreaWidget(DefenseArea.top),
              const PlayerAreaWidget(DefenseArea.middle),
              const PlayerAreaWidget(DefenseArea.bottom),
            ],
          ),
        ],
      ),
    );
  }
}


class PlayerAreaWidget extends ConsumerWidget {

  final DefenseArea area;
  const PlayerAreaWidget(this.area, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
         ref.read(playerProvider.notifier).setDefense(area);
        },
        child: Container(
          decoration: unselectedStyle,
          height: 16,
          width: 16,
        ),
      ),
    );
  }
}


final BoxDecoration unselectedStyle = BoxDecoration(
  //borderRadius: BorderRadius.circular(6),
  color: Colors.amber.withOpacity(.5),
);

class EnemyWidget extends ConsumerWidget {
  const EnemyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enemy = ref.watch(enemyProvider);
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: unselectedStyle,
                  height: 16,
                  width: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: unselectedStyle,
                  height: 16,
                  width: 16,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: unselectedStyle,
                  height: 16,
                  width: 16,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(enemy.health.toString())
            ],
          ),
        ],
      ),
    );
  }
}

class LoggerWidget extends ConsumerWidget {
  const LoggerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final log = ref.watch(loggerProvider);

    return SingleChildScrollView(
      child: ListView.builder(
        reverse: true,
        shrinkWrap: true,
          itemCount: log.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: const Icon(Icons.list),
                trailing:  Text(
                  log[index].event.toString(),
                  style: TextStyle(color: Colors.green, fontSize: 15),
                ),
                title: Text("List item $index"));
          }),
    );
  }
}


class AttackButtonWidget extends ConsumerWidget {
  const AttackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final player = ref.watch(playerProvider);
    final enemy = ref.watch(enemyProvider);
    return   Container(
      padding: const EdgeInsets.only(top: 48.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
     // width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          final aaa =  ref.read(loggerProvider.notifier);
          ref.read(playerProvider.notifier).action(enemy.power, aaa);
          ref.read(enemyProvider.notifier).action(player.power);
          ref.read(loggerProvider.notifier).add("description");
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
          'Attack',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}