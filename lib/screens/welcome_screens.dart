import 'package:cardio_2/screens/login_screen.dart';
import 'package:cardio_2/widgets/navbar_roots.dart';
import 'package:cardio_2/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(10),
          child: Column(
          children: [
            SizedBox(height: 10),
            const SizedBox(height: 50),
            Padding(
                padding: const EdgeInsets.all(20),
              child: Image.asset("images/screen2.png"),
            ),
            const SizedBox(height: 50),
            const Text("CardioSaver",
            style: TextStyle(
              color: Colors.blue,
              fontSize: 35,
              fontFamily: "Noto Sans",
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
              ),
            ),
            const SizedBox(height: 10),
            const Text("Save Your Heart Now",
              style: TextStyle(
                color: Colors.black54,
                fontSize: 18,
                fontFamily: "Noto Sans",
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 60),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                        ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 15, horizontal: 50
                      ),
                      child: Text("Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                  ),
                ),
                Material(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(50),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const SignUpScreen(),
                      ));
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: 15, horizontal: 50
                      ),
                      child: Text("Sign Up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )
    );
  }
}
