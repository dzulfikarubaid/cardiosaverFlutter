import 'dart:typed_data';

import 'package:cardio_2/features/auth_feature/view_model/auth_view_model.dart';
import 'package:cardio_2/services/media_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cardio_2/features/auth_feature/views/login_screen.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';

  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailAddressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  Uint8List? file;
  bool? isDoctor = false;

  @override
  void dispose() {
    fullnameController.dispose();
    passwordController.dispose();
    emailAddressController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AuthViewModel authViewModelRead = context.read<AuthViewModel>();
    AuthViewModel authViewModelWatch = context.watch<AuthViewModel>();

    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final pickedImage = await MediaService.pickImage();
                        setState(() => file = pickedImage!);
                      },
                      child: file != null
                          ? CircleAvatar(
                              radius: 45,
                              backgroundImage: MemoryImage(file!),
                            )
                          : const CircleAvatar(
                              radius: 45,
                              backgroundColor: Colors.blueAccent,
                              child: Icon(
                                Icons.add_a_photo,
                                size: 32,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                if (authViewModelWatch.errorText.isNotEmpty || file == null)
                  Text(
                    authViewModelWatch.errorText,
                    style: const TextStyle(
                      color: Colors.red, // You can customize the text color
                    ),
                  ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: fullnameController,
                    decoration: InputDecoration(
                      labelText: "Fulname",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: emailAddressController,
                    decoration: InputDecoration(
                      labelText: "Email Address",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          if (passToggle == true) {
                            passToggle = false;
                          } else {
                            passToggle = true;
                          }
                          setState(() {});
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  child: TextField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(
                      labelText: "Phone Number",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: const Icon(Icons.call),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isDoctor,
                        onChanged: (value) {
                          setState(() {
                            isDoctor = value;
                          });
                        },
                      ),
                      const Text(
                        'Register as a doctor ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        onTap: authViewModelWatch.loading
                            ? null
                            : () {
                                authViewModelRead.register(
                                  fullnameController.text,
                                  emailAddressController.text,
                                  passwordController.text,
                                  phoneNumberController.text,
                                  file,
                                  isDoctor!,
                                );
                              },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                          child: Center(
                            child: authViewModelWatch.loading
                                ? LoadingAnimationWidget.horizontalRotatingDots(
                                    color: Colors.white, size: 25)
                                : const Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account?",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => const LoginScreen());
                      },
                      child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
