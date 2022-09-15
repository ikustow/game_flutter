import 'package:flutter/material.dart';
import 'package:game_flutter/core/const.dart';
import 'package:game_flutter/get/game/controller/enemy_controller.dart';
import 'package:game_flutter/get/game/controller/logger_controler.dart';
import 'package:game_flutter/get/game/controller/player_controller.dart';
import 'package:get/get.dart';

import '../model/getx_logger.dart';

class GetXGamePage extends StatelessWidget {
  GetXGamePage({Key? key}) : super(key: key);
  final PlayerController playerController = PlayerController();
  final EnemyController enemyController = EnemyController();
  final LoggerController log = LoggerController();

  @override
  Widget build(BuildContext context) {
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
                PlayerWidget(
                  playerController: playerController,
                ),
                EnemyWidget(
                  enemyController: enemyController,
                ),
              ],
            ),
            AttackButtonWidget(
              playerController: playerController,
              enemyController: enemyController,
              log: log,
            ),
            LoggerWidget(
              log: log,
            ),
          ],
        ),
      ),
    );
  }
}

class PlayerWidget extends StatelessWidget {
  PlayerWidget({Key? key, required this.playerController}) : super(key: key);
  final PlayerController playerController;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Obx(() {
            return Column(
              children: [
                Text(playerController.player.value.health.toString())
              ],
            );
          }),
          Column(
            children: [
              PlayerAreaWidget(
                DefenseArea.top, playerController: playerController,),
              PlayerAreaWidget(
                DefenseArea.middle, playerController: playerController,),
              PlayerAreaWidget(
                DefenseArea.bottom, playerController: playerController,),
            ],
          ),
        ],
      ),
    );
  }
}

class PlayerAreaWidget extends StatelessWidget {

  final DefenseArea area;
  final PlayerController playerController;

  PlayerAreaWidget(this.area, {Key? key, required this.playerController})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() {
        return GestureDetector(
          onTap: () {
            playerController.setDefense(area);
          },
          child: Container(
            decoration: playerController.player.value.defenseArea.value == area
                ? selectedStyle
                : unselectedStyle,
            height: 16,
            width: 16,
          ),
        );
      }),
    );
  }
}


final BoxDecoration unselectedStyle = BoxDecoration(
  //borderRadius: BorderRadius.circular(6),
  color: Colors.amber.withOpacity(.5),
);

final BoxDecoration selectedStyle = BoxDecoration(
  //borderRadius: BorderRadius.circular(6),
  color: Colors.blueAccent.withOpacity(.5),
);

class EnemyWidget extends StatelessWidget {
  final EnemyController enemyController;

  EnemyWidget({Key? key, required this.enemyController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              Text(enemyController.enemy.value.health.toString())
            ],
          ),
        ],
      ),
    );
  }
}

class LoggerWidget extends StatelessWidget {
  final LoggerController log;

  const LoggerWidget({Key? key, required this.log}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(() {
        return ListView.builder(
            reverse: true,
            shrinkWrap: true,
            itemCount: log.loggerList.value.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                  leading: const Icon(Icons.list),
                  trailing: Text(
                    log.loggerList.value[index].event.toString(),
                    style: TextStyle(color: Colors.green, fontSize: 15),
                  ),
                  title: Text("List item $index"));
            });
      }),
    );
  }
}


class AttackButtonWidget extends StatelessWidget {
  final PlayerController playerController;
  final EnemyController enemyController;

  final LoggerController log;

  const AttackButtonWidget(
      {Key? key, required this.playerController, required this.enemyController, required this.log})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 48.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          playerController.action(enemyController.enemy.value.power.value);
          enemyController.action(playerController.player.value.power.value);
          log.addLogEvent(GetXLogger("description"));
        },
        textColor: Colors.blue.shade700,
        textTheme: ButtonTextTheme.primary,
        minWidth: 100,
        padding: const EdgeInsets.all(18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
          side: BorderSide(color: Colors.blue.shade700),
        ),
        child: Text(
          'Attack',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}