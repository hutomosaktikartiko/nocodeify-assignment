class MessageEntity {
  final String message;
  final DateTime time;
  final bool isMe;

  const MessageEntity({
    required this.message,
    required this.time,
    required this.isMe,
  });
}

final mockMessages = [
  ...List.generate(
    50,
    (index) => MessageEntity(
      isMe: index.isEven,
      message:
          "$index lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos. Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, quos.",
      time: DateTime.now().subtract(Duration(hours: index)),
    ),
  ),
];
