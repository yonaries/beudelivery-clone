import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../controller/notifications_controller.dart';

class NotificationTile extends StatefulWidget {
  final int index;
  final String image;
  final String message;
  final String time;
  final Color tileColor;

  const NotificationTile(
      {Key? key,
      required this.index,
      required this.image,
      required this.message,
      required this.time,
      required this.tileColor})
      : super(key: key);

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final controller = Provider.of<NotificationsController>(context);

    return GestureDetector(
      onTap: () => controller.clickToSeen(index: widget.index),
      child: Container(
        color: widget.tileColor,
        width: currentWidth,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 20.0, right: 10.0, top: 10.0, bottom: 10.0),
              child: SizedBox(
                width: 70,
                height: 70,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    widget.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20.0),
                  width: currentWidth * 0.7,
                  child: Text(
                    widget.message,
                    style: const TextStyle(fontSize: 15),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  width: currentWidth * 0.7,
                  child: Text(
                    widget.time,
                    style: const TextStyle(color: Colors.grey),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
