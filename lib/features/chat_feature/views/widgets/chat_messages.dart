import 'package:cardio_2/features/chat_feature/models/message.model.dart';
import 'package:cardio_2/features/chat_feature/view_model/chat_view_model.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'message_bubble.dart';

class ChatMessages extends StatelessWidget {
  ChatMessages({super.key, required this.receiverId});
  final String receiverId;

  @override
  Widget build(BuildContext context) => Consumer<ChatViewModel>(
        builder: (context, value, child) => value.messages.isEmpty
            ? const Expanded(
                child: EmptyWidget(icon: Icons.waving_hand, text: 'Say Hello!'),
              )
            : Expanded(
                child: ListView.builder(
                  controller: Provider.of<ChatViewModel>(context, listen: false)
                      .scrollController,
                  itemCount: value.messages.length,
                  itemBuilder: (context, index) {
                    final isTextMessage =
                        value.messages[index].messageType == MessageType.text;
                    final isMe = receiverId != value.messages[index].senderId;

                    return isTextMessage
                        ? MessageBubble(
                            isMe: isMe,
                            message: value.messages[index],
                            isImage: false,
                          )
                        : MessageBubble(
                            isMe: isMe,
                            message: value.messages[index],
                            isImage: true,
                          );
                  },
                ),
              ),
      );
}
