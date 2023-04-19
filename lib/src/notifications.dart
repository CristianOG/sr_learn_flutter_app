import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learn_app/src/log.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'package:flutter_native_timezone/flutter_native_timezone.dart';

class Notifications {

  // #region SETUP

  // make this a singleton class
  Notifications._privateConstructor();
  static final Notifications instance = Notifications._privateConstructor();

  static bool initialised = false;
  static NotificationAppLaunchDetails? notificationAppLaunchDetails;

  static const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('app_icon');

  // final DarwinInitializationSettings initializationSettingsDarwin =
  //     DarwinInitializationSettings(
  //         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  // final LinuxInitializationSettings initializationSettingsLinux =
  //     LinuxInitializationSettings(
  //         defaultActionName: 'Open notification');

  static const InitializationSettings initializationSettings =
      InitializationSettings(
    android: initializationSettingsAndroid,
    // iOS: initializationSettingsDarwin,
    // macOS: initializationSettingsDarwin,
    // linux: initializationSettingsLinux
  );

  static final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

  static void initNotifications() async {
    if (initialised) return;

    initialised = true;

    // initialize timezone database needed for scheduling notifications
    tz.initializeTimeZones();
    final String currentTimeZone = await FlutterNativeTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    notificationAppLaunchDetails = await notificationsPlugin.getNotificationAppLaunchDetails();
    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      Log.debug(notificationAppLaunchDetails!.notificationResponse?.payload);
      //selectedNotificationPayload = notificationAppLaunchDetails!.notificationResponse?.payload;
    }

    await notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: notificationTap,
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  // #endregion

  // #region NOTIFICATIONS SETTINGS

  static const String sraGroupKey = 'com.android.example.SRA';
  static const String sraChannelId = 'SRA';
  static const String sraChannelName = 'SRA Notifications';
  static const String sraChannelDescription = 'Receive SRA notifications';

  static const AndroidNotificationDetails sraAndroidNofiticationDetails =
      AndroidNotificationDetails(sraChannelId, sraChannelName,
          channelDescription: sraChannelDescription,
          groupKey: sraGroupKey,
          priority: Priority.high,
          importance: Importance.max);

  static const NotificationDetails sraNofiticationDetails =
      NotificationDetails(android: sraAndroidNofiticationDetails);
  // #endregion

  int id = 0;
 
  static void notificationTap (NotificationResponse notificationResponse) async {
    Log.debug('notification id: ${notificationResponse.id}');

    switch (notificationResponse.notificationResponseType) {
      case NotificationResponseType.selectedNotification:
        //selectNotificationStream.add(notificationResponse.payload);
        break;
      case NotificationResponseType.selectedNotificationAction:
        // if (notificationResponse.actionId == navigationActionId) {
        //   selectNotificationStream.add(notificationResponse.payload);
        // }
        break;
    }

    //Note that this callback is only intended to work when the app is running.
    //https://pub.dev/packages/flutter_local_notifications#getting-details-on-if-the-app-was-launched-via-a-notification-created-by-this-plugin

    //when the app starts if you need to handle when a notification triggering the launch for an app e.g. change the home route of the app for deep-linking
    //notificationsPlugin.getNotificationAppLaunchDetails();


    Log.debug('notification payload: ${notificationResponse.payload}');
    Log.debug('notification input: ${notificationResponse.input}');

    // await Navigator.push(
    //   context,
    //   MaterialPageRoute<void>(builder: (context) => SecondScreen(payload)),
    // );
  }

  @pragma('vm:entry-point')
  static void notificationTapBackground(NotificationResponse notificationResponse) {

    // handle action
    Log.debug(notificationResponse.actionId);
    final String? payload = notificationResponse.payload;
    if (payload != null) {
      Log.debug('notification payload: $payload');
    }

    Log.debug('notification input: ${notificationResponse.input}');

  }

  Future<void> showNotificationWithActions() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      //fullScreenIntent: true,
      actions: <AndroidNotificationAction>[
        //AndroidNotificationAction('id_1', 'Action 1', icon: DrawableResourceAndroidBitmap('app_icon'), contextual: true),
        AndroidNotificationAction('id_2', 'Action 2'),
        AndroidNotificationAction('id_3', 'Show interface', showsUserInterface: true, cancelNotification: false),
        AndroidNotificationAction(
          'id_4',
          'Enter Text',
          icon: DrawableResourceAndroidBitmap('app_icon'),
          inputs: <AndroidNotificationActionInput>[
            AndroidNotificationActionInput(
              label: 'Enter a message',
            ),
          ],
        ),
        AndroidNotificationAction(
          'id_5',
          'Text choice',
          icon: DrawableResourceAndroidBitmap('app_icon'),
          inputs: <AndroidNotificationActionInput>[
            AndroidNotificationActionInput(
              choices: <String>['ABC', 'DEF'],
              allowFreeFormInput: true,
            ),
          ],
          contextual: true,
        ),
      ],
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);

    await notificationsPlugin.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  Future<void> scheduleNotification(title, body) async {
    await notificationsPlugin.zonedSchedule(
        0,
        title,
        body,
        tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
        sraNofiticationDetails,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);

    //schedule a notification to appear on a daily or weekly basis by telling the plugin to match on the time or a combination of day of the week and time respectively.
    //matchDateTimeComponents

    // const AndroidNotificationDetails androidNotificationDetails =
    //     AndroidNotificationDetails(
    //         'repeating channel id', 'repeating channel name',
    //         channelDescription: 'repeating description');
    // const NotificationDetails notificationDetails =
    //     NotificationDetails(android: androidNotificationDetails);

    // await notificationsPlugin.periodicallyShow(0, 'repeating title',
    // 'repeating body', RepeatInterval.everyMinute, notificationDetails,
    // androidAllowWhileIdle: true);

    // await notificationsPlugin.zonedSchedule(
    //     0,
    //     'scheduled title',
    //     'scheduled body',
    //     tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)),
    //     const NotificationDetails(
    //         android: AndroidNotificationDetails(
    //             'full screen channel id', 'full screen channel name',
    //             channelDescription: 'full screen channel description',
    //             priority: Priority.high,
    //             importance: Importance.high,
    //             fullScreenIntent: true)),
    //     androidAllowWhileIdle: true,
    //     uiLocalNotificationDateInterpretation:
    //         UILocalNotificationDateInterpretation.absoluteTime);
  }

  /*
    // Create the summary notification to support older devices that pre-date
    /// Android 7.0 (API level 24).
    ///
    /// Recommended to create this regardless as the behaviour may vary as
    /// mentioned in https://developer.android.com/training/notify-user/group
    const List<String> lines = <String>[
        'Alex Faarborg  Check this out',
        'Jeff Chang    Launch Party'
    ];
    const InboxStyleInformation inboxStyleInformation = InboxStyleInformation(
        lines,
        contentTitle: '2 messages',
        summaryText: 'janedoe@example.com');
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(groupChannelId, groupChannelName,
            channelDescription: groupChannelDescription,
            styleInformation: inboxStyleInformation,
            groupKey: groupKey,
            setAsGroupSummary: true);
    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin.show(
        3, 'Attention', 'Two messages', notificationDetails);

  */

    Future<void> _cancelNotification() async {
      await notificationsPlugin.cancel(--id);
    }

    Future<void> _cancelNotificationWithTag() async {
      await notificationsPlugin.cancel(--id, tag: 'tag');
    }

  Future<List<PendingNotificationRequest>> getPendingNotifications() async {
    return await notificationsPlugin.pendingNotificationRequests();
  }

  Future<List<ActiveNotification>?> getActiveNotifications() async {
    return await notificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.getActiveNotifications();
  }

  Future<void> isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await notificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;
    }
  }

  Future<void> requestPermissions() async {
    // if (Platform.isIOS || Platform.isMacOS) {
    //   await notificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           IOSFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    //   await notificationsPlugin
    //       .resolvePlatformSpecificImplementation<
    //           MacOSFlutterLocalNotificationsPlugin>()
    //       ?.requestPermissions(
    //         alert: true,
    //         badge: true,
    //         sound: true,
    //       );
    // } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          notificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
    //}
  }
}
