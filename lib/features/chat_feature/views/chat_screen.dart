import 'package:cardio_2/features/chat_feature/view_model/chat_view_model.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/chat_messages.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key, required this.userId});

  final String userId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  void initState() {
    Provider.of<ChatViewModel>(context, listen: false)
      ..getUserById(widget.userId)
      ..getMessages(widget.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(65),
          child: Consumer<ChatViewModel>(
            builder: (context, value, child) => value.user != null
                ? AppBar(
                    backgroundColor: Colors.blueAccent,
                    leadingWidth: 30,
                    title: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(value.user!.image),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      value.user!.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    if (value.user!.isDoctor)
                                      const Text(
                                        " (Doctor)",
                                        style: TextStyle(
                                          color: Colors.blueAccent,
                                          fontSize: 18,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                  ],
                                ),
                                Text(
                                  value.user!.isOnline ? 'Online' : 'Offline',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                : const SizedBox(),
          )),

      // Chat Screen
      body: Column(
        children: [
          ChatMessages(receiverId: widget.userId),
          ChatTextField(receiverId: widget.userId)
        ],
      ),
    );
  }
}
