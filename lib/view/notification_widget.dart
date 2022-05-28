import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({Key? key}) : super(key: key);

  @override
  _NotificationWidgetState createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {

  Future<void> notify() {
    final flnp = FlutterLocalNotificationsPlugin();
    return flnp.initialize(
      InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      ),
    ).then((_) => flnp.show(0, 'title', 'body', NotificationDetails(
      android: AndroidNotificationDetails(
        'channel_id',
        'channel_name',
        'channel_description',
      ),
    )));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextButton(
        onPressed: () {



        },
        child: Text("通知を出す。"),
      ),
    );
  }
}
