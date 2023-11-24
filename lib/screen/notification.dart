import 'package:flutter/material.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Notification Screen'),
      ),
    );
  }
}
