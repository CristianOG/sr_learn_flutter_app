import 'package:learn_app/src/log.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

class TaskScheduler {

  @pragma('vm:entry-point') // Mandatory if the App is obfuscated or using Flutter 3.1+
  void callbackDispatcher() {
    Workmanager().executeTask((task, inputData) async {

      Log.debug(task);

      int? totalExecutions;
      final sharedPreference = await SharedPreferences.getInstance(); //Initialize dependency

      try { //add code execution
        totalExecutions = sharedPreference.getInt("totalExecutions");
        sharedPreference.setInt("totalExecutions", totalExecutions == null ? 1 : totalExecutions+1);
      } catch(err) {
        Log.error(err.toString());
        throw Exception(err);
      }

      return Future.value(true);
    });
  }
  
// Workmanager().initialize(
  //   callbackDispatcher, // The top level function, aka callbackDispatcher
  //   isInDebugMode: true // If enabled it will post a notification whenever the task is running. Handy for debugging tasks
  // );

  // Workmanager().registerOneOffTask(
  //   "one-off",
  //   "test1", // Ignored on iOS
  //   initialDelay: const Duration(seconds: 2),
  //   constraints: Constraints(
  //     // connected or metered mark the task as requiring internet
  //     networkType: NetworkType.connected,
  //     // require external power
  //     requiresCharging: true,
  //   ),
  //   //inputData: ... // fully supported
  // );

  // //Periodic task registration
  // Workmanager().registerPeriodicTask(
  //     "periodic-task-identifier", 
  //     "test2", 
  //     // When no frequency is provided the default 15 minutes is set.
  //     // Minimum frequency is 15 min. Android will automatically change your frequency to 15 min if you have configured a lower frequency.
  //     frequency: const Duration(minutes: 15),
  // );


}