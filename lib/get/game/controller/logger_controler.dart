import 'package:game_flutter/get/game/model/getx_logger.dart';
import 'package:get/get.dart';

class LoggerController extends GetxController {

  final loggerList = <GetXLogger>[].obs;

  void addLogEvent(GetXLogger event){
    loggerList.add(event);
  }

}