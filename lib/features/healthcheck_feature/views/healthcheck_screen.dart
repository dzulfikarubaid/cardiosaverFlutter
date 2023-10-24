import 'package:flutter/material.dart';

class HealthcheckScreen extends StatelessWidget {
  const HealthcheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 80, 128, 240),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Stack(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Text(
                          "My Health",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: const Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                          size: 25,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 80),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "images/my_health.png",
                          width: 800,
                          height: 100,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Container(
              height: MediaQuery.of(context).size.height / 1.4,
              width: double.infinity,
              padding: const EdgeInsets.only(
                top: 10,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisSize: MainAxisSize.values,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 236, 238, 255),
                        blurRadius: 4,
                        spreadRadius: 3,
                      )
                    ]),
                    child: SizedBox(
                      // width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "History",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 280),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Row(
                            // crossAxisAlignment: CrossAxisAlignment.values(0.5),
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "S",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "M",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "T",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "W",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "T",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "F",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                "S",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.black26,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  )),
                            ],
                          ),
                          const SizedBox(height: 50),
                          const Text(
                            "Records",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(255, 236, 238, 255),
                        blurRadius: 4,
                        spreadRadius: 3,
                      )
                    ]),
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15),
                                child: Text(
                                  "Recommendation",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(width: 195),
                              Padding(
                                padding: EdgeInsets.zero,
                                child: Text(
                                  "More",
                                  style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 100,
                                width: 110,
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 65, left: 30),
                                  child: Text(
                                    "Foods",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 110,
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 65, left: 30),
                                  child: Text(
                                    "Foods",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                              Container(
                                height: 100,
                                width: 110,
                                decoration: const BoxDecoration(
                                  color: Colors.black26,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 65, left: 30),
                                  child: Text(
                                    "Foods",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
