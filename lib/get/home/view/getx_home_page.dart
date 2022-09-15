import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:game_flutter/auth/providers/auth_provider.dart';
import 'package:game_flutter/game/game.dart';
import 'package:game_flutter/generated/l10n.dart';
import 'package:game_flutter/get/game/view/getx_game.dart';
import 'package:game_flutter/get/home/controlers/hero_controller.dart';
import 'package:get/get.dart';



class GetXHomePage extends ConsumerWidget {
  const GetXHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(fireBaseAuthProvider);
    final auth = ref.watch(authenticationProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                  "${S
                      .of(context)
                      .homeUserTitle} ${data.currentUser!.email}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(S
                  .of(context)
                  .homeGameTitle),
            ),
            GetXRowOfHeroes(),
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

class GetXRowOfHeroes extends StatelessWidget {

  GetXRowOfHeroes({Key? key,}) : super(key: key);
  final GetXHeroController controller = GetXHeroController();

  @override
  Widget build(BuildContext context) {

    return
      Obx(() {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                controller.selectKnight();
              },
              child: Container(
                decoration: controller.knight.value.selected.value ? selectedHeroStyle: unSelectedHeroStyle,
                child: Column(
                  children: [
                    Text(controller.knight.value.description.toString()),
                    Text(controller.knight.value.id.toString()),
                    Text(controller.knight.value.selected.toString()),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
             controller.selectWizard();
              },
              child: Container(
                decoration: controller.wizard.value.selected.value ? selectedHeroStyle: unSelectedHeroStyle,
                child: Column(
                  children: [
                    Text(controller.wizard.value.description.toString()),
                    Text(controller.wizard.value.id.toString()),
                    Text(controller.wizard.value.selected.toString()),
                  ],
                ),
              ),
            ),
          ],
        );
      });
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

class StartGameButtonWidget extends StatelessWidget {
  const StartGameButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 48.0),
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GetXGamePage()),
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
        child: Text(
          'Start game ',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
