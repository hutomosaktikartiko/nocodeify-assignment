import 'package:flutter/material.dart';

class UnreadChatCountWidget extends StatelessWidget {
  final int count;
  const UnreadChatCountWidget({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
      child: Text(
        count.toString(),
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(fontSize: 10, color: Colors.white),
      ),
    );
  }
}
