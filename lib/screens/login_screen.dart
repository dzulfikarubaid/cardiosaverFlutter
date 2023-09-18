
import 'package:cardio_2/screens/signup_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
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
              const SizedBox(height: 10),
              Padding(padding: const EdgeInsets.all(12),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  label: const Text("Enter Username"),
                  prefixIcon: const Icon(Icons.person),
                 ),
                ),
              ),
              Padding(padding: const EdgeInsets.all(12),
                child: TextField(
                  obscureText: passToggle ? true : false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: const Text("Enter Password"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: (){
                        if (passToggle == true){
                          passToggle = false;
                        }
                        else{
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ?  const Icon(CupertinoIcons.eye_slash_fill)
                          :  const Icon(CupertinoIcons.eye_fill),
                    ),
                    // prefixIcon: Icon(Icon.person),
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
                      onTap: (){
                        // Navigator.push(context, MaterialPageRoute(
                        //     builder: (context) =>
                        // ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40
                        ),
                        child: Center(
                          child: Text("Log In",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),),
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
                  const Text("Don't have any account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                    ),
                  ),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                    ));
                  },
                      child: const Text("Create Account",
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
    )
    );
  }
}
