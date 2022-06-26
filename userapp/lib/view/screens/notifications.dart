import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:userapp/controller/notifications_controller.dart';
import 'package:userapp/view/components/notification/notification_tile.dart';
import 'package:userapp/view/screens/navbar.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationState();
}

class _NotificationState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final controller = Provider.of<NotificationsController>(context);
    final notifications = Provider.of<NotificationsController>(context).data;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(245, 245, 248, 1),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color.fromRGBO(245, 245, 248, 1),
          statusBarIconBrightness: Brightness.dark,
        ),
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context, true),
          child: const Icon(
            Icons.arrow_back_ios,
            size: 17,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () => controller.markAsSeen(),
            child: const Padding(
              padding: EdgeInsets.all(20.0),
              child: Text(
                "Mark as read",
                style: TextStyle(color: Colors.deepOrange),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: SizedBox(
              width: currentWidth,
              child: const Text(
                "Notifications",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifications.length,
              itemBuilder: (context, index) => NotificationTile(
                image: notifications[index].image,
                message: notifications[index].message,
                time: notifications[index].time,
                tileColor: controller.checkNotificationStatus(
                    status: notifications[index].status),
                index: index,
              ),
            ),
          )
        ],
      ),
    );
  }
}
