import 'package:cardio_2/features/chat_feature/view_model/chat_view_model.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/custom_text_form_field.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/empty_widget.dart';
import 'package:cardio_2/features/chat_feature/views/widgets/user_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersSearchScreen extends StatefulWidget {
  const UsersSearchScreen({Key? key}) : super(key: key);

  @override
  State<UsersSearchScreen> createState() => _UsersSearchScreenState();
}

class _UsersSearchScreenState extends State<UsersSearchScreen> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          foregroundColor: Colors.black,
          title: const Text(
            'Users Search',
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomTextFormField(
                controller: controller,
                hintText: 'Search',
                onChanged: (val) =>
                    Provider.of<ChatViewModel>(context, listen: false)
                        .searchUser(val),
              ),
            ),
            Consumer<ChatViewModel>(
              builder: (context, value, child) => Expanded(
                child: controller.text.isEmpty
                    ? const EmptyWidget(
                        icon: Icons.search, text: 'Search of User')
                    : ListView.builder(
                        itemCount: value.search.length,
                        itemBuilder: (context, index) =>
                            value.search[index].uid !=
                                    FirebaseAuth.instance.currentUser?.uid
                                ? UserItem(user: value.search[index])
                                : const SizedBox(),
                      ),
              ),
            ),
          ],
        ),
      );
}
