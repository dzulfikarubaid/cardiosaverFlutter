import 'package:custom_clippers/custom_clippers.dart';
import 'package:flutter/material.dart';

class ChatSample extends StatelessWidget {
  const ChatSample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding:  const EdgeInsets.only(right: 80),
          child: ClipPath(
            clipper: UpperNipMessageClipper(MessageType.receive),
            child: Container(
              padding:  const EdgeInsets.all(20),
              decoration:  const BoxDecoration(
                color: Colors.black26,
              ),
              child:  const Text("Hello, what I can do for you, you can book appointment directly",
              style: TextStyle(
                fontSize: 16,
              ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 80),
            child: ClipPath(
              clipper: LowerNipMessageClipper(MessageType.send),
                child: Container(
                padding: const EdgeInsets.only(left: 20, top: 10, bottom: 25, right: 20),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 80, 128, 240),
                ),
                  child: const Text("Hello Doctor, are you there",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                    ),
                  ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
