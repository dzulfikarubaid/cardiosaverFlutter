import 'package:cardio_2/features/chat_feature/models/user.model.dart';
import 'package:cardio_2/features/chat_feature/view_model/chat_view_model.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/user_item.dart';
import 'package:cardio_2/services/firebase_firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen>
    with WidgetsBindingObserver {
  // final notificationService = NotificationsService();
  final userData = [
    UserModel(
      uid: '1',
      name: 'Hazy',
      email: 'test@test.test',
      isDoctor: true,
      image: 'https://i.pravatar.cc/150?img=0',
      isOnline: true,
      lastActive: DateTime.now(),
    ),
    UserModel(
      uid: '1',
      name: 'Charlotte',
      email: 'test@test.test',
      isDoctor: true,
      image: 'https://i.pravatar.cc/150?img=1',
      isOnline: false,
      lastActive: DateTime.now(),
    ),
    UserModel(
      uid: '2',
      name: 'Ahmed',
      email: 'test@test.test',
      isDoctor: false,
      image: 'https://i.pravatar.cc/150?img=2',
      isOnline: true,
      lastActive: DateTime.now(),
    ),
    UserModel(
      uid: '3',
      name: 'Prateek',
      email: 'test@test.test',
      isDoctor: false,
      image: 'https://i.pravatar.cc/150?img=3',
      isOnline: false,
      lastActive: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Provider.of<ChatViewModel>(context, listen: false).getAllUsers();

    // notificationService.firebaseNotification(context);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    switch (state) {
      case AppLifecycleState.resumed:
        FirebaseFirestoreService.updateUserData({
          'lastActive': DateTime.now(),
          'isOnline': true,
        });
        break;

      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
      case AppLifecycleState.detached:
        FirebaseFirestoreService.updateUserData({'isOnline': false});
        break;

      case AppLifecycleState.hidden:
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITIKE
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Massages",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 30),

            // SEARCH USER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 10,
                        spreadRadius: 2,
                      )
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search", border: InputBorder.none),
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.search,
                      color: Color.fromARGB(255, 80, 128, 240),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // ACTIVE USER
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Text(
            //     "Active Now",
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
            // SizedBox(
            //   height: 90,
            //   child: ListView.builder(
            //       scrollDirection: Axis.horizontal,
            //       itemCount: 5,
            //       itemBuilder: (context, index) {
            //         return Container(
            //           margin: const EdgeInsets.symmetric(horizontal: 12),
            //           width: 65,
            //           height: 65,
            //           decoration: const BoxDecoration(
            //               shape: BoxShape.circle,
            //               color: Colors.white,
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.black12,
            //                   spreadRadius: 2,
            //                   blurRadius: 10,
            //                 )
            //               ]),
            //           child: Stack(
            //             textDirection: TextDirection.rtl,
            //             children: [
            //               Center(
            //                 child: SizedBox(
            //                   height: 65,
            //                   width: 65,
            //                   child: ClipRRect(
            //                     borderRadius: BorderRadius.circular(30),
            //                     child: Image.asset(
            //                       "images/${doctors[index]}",
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                 ),
            //               ),
            //               Container(
            //                 margin: const EdgeInsets.all(4),
            //                 padding: const EdgeInsets.all(3),
            //                 height: 20,
            //                 width: 20,
            //                 decoration: const BoxDecoration(
            //                   color: Colors.white,
            //                   shape: BoxShape.circle,
            //                 ),
            //                 child: Container(
            //                   decoration: const BoxDecoration(
            //                       color: Colors.green, shape: BoxShape.circle),
            //                 ),
            //               )
            //             ],
            //           ),
            //         );
            //       }),
            // ),

            // RECENT CHAT
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Recent Chat",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 200.0,
              child: Consumer<ChatViewModel>(builder: (context, value, child) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: value.users.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 10),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => value.users[index].uid !=
                          FirebaseAuth.instance.currentUser?.uid
                      ? UserItem(user: value.users[index])
                      : const SizedBox(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
