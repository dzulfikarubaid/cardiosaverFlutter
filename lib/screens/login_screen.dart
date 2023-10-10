import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cardio_2/screens/signup_screen.dart';
import 'package:cardio_2/widgets/navbar_roots.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool passToggle = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? errorText;
  bool isLoading = false; // Variable untuk menampilkan loading indicator

  Future<void> _login() async {
    setState(() {
      isLoading = true; // Menampilkan loading indicator saat login dimulai
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );

      // Login berhasil, arahkan pengguna ke layar NavBarRoots
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavBarRoots(),
        ),
      );
      // print('Login successful: ${userCredential.user?.email}');
      setState(() {
        errorText = null;
        isLoading =
            false; // Sembunyikan loading indicator setelah login berhasil
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading = false; // Sembunyikan loading indicator saat login gagal
      });

      if (e.code == 'user-not-found') {
        setState(() {
          errorText = 'No user found for that email.';
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          errorText = 'Wrong password provided.';
        });
      } else if (e.code == 'invalid-email') {
        setState(() {
          errorText = 'Please enter a valid email.';
        });
      } else {
        setState(() {
          errorText = 'An unknown error occurred.';
        });
        print('Error occurred: $e');
      }
    } catch (e) {
      setState(() {
        isLoading =
            false; // Sembunyikan loading indicator saat terjadi kesalahan
        errorText = 'An error occurred: $e';
      });
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final localStorage = GetStorage();

    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset("images/screen2.png"),
                ),
                Text(
                  errorText ?? " ", // Menampilkan pesan kesalahan jika ada
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter Email",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: passwordController,
                    obscureText: passToggle ? true : false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Enter Password",
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                        onTap: () {
                          setState(() {
                            passToggle = !passToggle;
                          });
                        },
                        child: passToggle
                            ? const Icon(CupertinoIcons.eye_slash_fill)
                            : const Icon(CupertinoIcons.eye_fill),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: double.infinity,
                    child: Material(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(50),
                      child: InkWell(
                        onTap: isLoading
                            ? null
                            : _login, // Nonaktifkan tombol saat loading
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 40,
                          ),
                          child: Center(
                            child: isLoading
                                ? LoadingAnimationWidget.horizontalRotatingDots(
                                    color: Colors.white,
                                    size:
                                        25) // Tampilkan loading indicator jika isLoading true
                                : const Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 18,
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
