import 'package:cardio_2/features/chat_feature/models/user.model.dart';
import 'package:cardio_2/features/chat_feature/views/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:flutter/material.dart';

class UserItem extends StatefulWidget {
  const UserItem({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  State<UserItem> createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.user.image),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CircleAvatar(
                  backgroundColor:
                      widget.user.isOnline ? Colors.green : Colors.grey,
                  radius: 5,
                ),
              ),
            ],
          ),
          title: Row(
            children: [
              Text(
                widget.user.name,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.user.isDoctor)
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
          subtitle: Text(
            'Last Active : ${timeago.format(widget.user.lastActive)}',
            maxLines: 2,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
