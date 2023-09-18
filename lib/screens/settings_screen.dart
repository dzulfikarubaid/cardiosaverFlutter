import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
        left: 20,
        right: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          const ListTile(
            leading: CircleAvatar(
              maxRadius: 30,
            backgroundImage: AssetImage("images/user.png"),
            ),
           // minLeadingWidth: double.infinity,//MediaQuery.of(context).size.width/0.78,
            title: Text(
              "Santoso K.",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            subtitle: Text("54 Tahun",
            style: TextStyle(
              fontWeight: FontWeight.w900,
            ),
            ),
          ),
          Divider(height: 25,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.people_alt_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Linked Account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.person_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Account",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.globe,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Language",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(height: 20,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                CupertinoIcons.exclamationmark_circle,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "About",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.help_outline_rounded,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Help",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.feedback_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Feedback",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
          Divider(height: 20,
            thickness: 2,
            color: Colors.black26,
          ),
          ListTile(
            onTap: (){},
            leading: Container(
              padding: const EdgeInsets.all(10),
              child: const Icon(
                Icons.logout_outlined,
                color: Colors.black54,
                size: 30,
              ),
            ),
            title: const Text(
              "Log out",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
          ),
        ],
      ),
    );
  }
}
