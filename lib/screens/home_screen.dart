import 'dart:async';
import 'dart:convert';
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:http/http.dart' as http;
import 'package:cardio_2/screens/appointment_screen.dart';
import 'package:cardio_2/screens/healthcheck_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userName; // Variable untuk menyimpan nama pengguna
  String? imageUrl; // Variable untuk menyimpan URL gambar profil
  // Function untuk mendapatkan nama pengguna dari Firestore
  Future<void> getUserName() async {
     final User? user = _auth.currentUser;

  if (user != null) {
    setState(() {
      userName = user.displayName?.split(' ').first;
      imageUrl = user.photoURL ?? '';
    });
  }
}
  @override
  void initState() {
    super.initState();
    getUserName(); // Panggil fungsi untuk mendapatkan nama pengguna saat widget diinisialisasi
  }

  // Future<void> _fetchData() async {
  //   final response =
  //   await http.get(Uri.parse('https://'));

  //   if (response.statusCode == 200) {
  //     final responseData = json.decode(response.body);
  //     if (responseData['data'] != null && responseData['data'].isNotEmpty) {
  //       final firstDataKey = responseData['data'].keys.first;
  //       firstDataValue = responseData['data']
  //       [firstDataKey]; // Menyimpan nilai dalam variabel
  //       logger.d(
  //           'First data key: $firstDataKey, First data value: $firstDataValue');
  //       setState(() {}); // Memanggil setState untuk memperbarui tampilan
  //     } else {
  //       logger.w('No data available in the response');
  //     }
  //   } else {
  //     logger.e('Request failed with status: ${response.statusCode}');
  //   }
  // }

  // void _fetchDataPeriodically() {
  //   _fetchData();
  //   _fetchDataTimer = Timer.periodic(Duration(milliseconds: 10), (_) {
  //     _fetchData();
  //   });
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _fetchDataPeriodically();
  // }

  // @override
  // void dispose() {
  //   _fetchDataTimer.cancel(); // Batalkan timer saat widget dihapus
  //   super.dispose();
  // }
  
  
  
  List doctors = [
    "doc_1.png",
    "doc_2.png",
    "doc_3.png",
  ];

  List articles = [
    "heart.png",
    "heart2.png",
    "cardio.jpg",
    "cardio.jpg",
  ];

  List name = [
    "dr. Annisa, Sp.Jp",
    "dr. Hartono, Sp.Jp",
    "dr. Bambang, Sp.Jp",
  ];

  List hospital = [
    "RSUD dr. Soetomo Surabaya",
    "RSUD SILOAM Surabaya",
    "RSUD Bhakti Dharma H",
  ];

  List imgs = [
    "icon_lungs.png",
    "icon_heartrate.png"
  ];

  List rating = [
    "4.8",
    "4.7",
    "4.9"
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child:Scaffold(
          backgroundColor:  const Color.fromARGB(255, 80, 128, 240),
            appBar: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Image.asset("images/logo.png",
                  fit: BoxFit.contain,
                ),
              ),
              backgroundColor: Colors.white,
              title: const Row(
                children: [
                  SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 15),
                          child: Text("CardioSaver",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 150),
                          child: Icon(Icons.notifications_on_outlined,
                            size: 25,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),

                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical:20
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Hello, ${userName ?? ''}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Noto Sans',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 35, bottom: 40),
                              child: Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Icon(Icons.location_pin,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Text("Sukolilo, Surabaya",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w300,
                                          fontFamily: 'Noto Sans',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 70, bottom: 10),
                              child: Row(
                                children: [
                                  Icon(Icons.warning,
                                    size: 20,
                                    color: Colors.red,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Text("High Risk",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Noto Sans',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 52.5,
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: imageUrl != null ? NetworkImage(imageUrl!) : NetworkImage('https://www.pngall.com/wp-content/uploads/5/User-Profile-PNG-Image.png'),
                          ),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(height: 10),
                  Container(
                    height: MediaQuery.of(context).size.height/0.75,
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 25,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.heart,
                                size: 30,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("My Health",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const HealthcheckScreen(),
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 255, 255), //Color.fromARGB(255, 235, 237, 255),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/3.5,
                                  height: MediaQuery.of(context).size.height/5.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("images/vector_heart.png"),
                                          const SizedBox(width: 10),
                                          const Text("Heart rate",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Image.asset("images/icon_heartrate.png",
                                          scale: 1,
                                        ),
                                      ),
                                      const Row(
                                        // mainAxisAlignment: MainAxisAlignment.,
                                        children: [
                                          Text("50",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          SizedBox(width: 10),
                                          Text("bpm",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => const HealthcheckScreen(),
                                ));
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10),
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 255, 255, 255), //Color.fromARGB(255, 235, 237, 255),
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2,
                                    )
                                  ],
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width/3.5,
                                  height: MediaQuery.of(context).size.height/5.2,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Image.asset("images/vector_rr.png"),
                                          const SizedBox(width: 10),
                                          const Text("Interval rr",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 20),
                                        child: Image.asset("images/icon_lungs.png",
                                          scale: 0.95,
                                        ),
                                      ),
                                      const Row(
                                        // mainAxisAlignment: MainAxisAlignment.,
                                        children: [
                                          Text("1.2",
                                            style: TextStyle(
                                                fontSize: 24,
                                                fontWeight: FontWeight.bold
                                            ),
                                          ),

                                          SizedBox(width: 10),
                                          Text("sekon",
                                            style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.person,
                                size: 30,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("Doctors",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 225,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: doctors.length,
                            itemBuilder: (context,index){
                              return InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => AppointmentScreen(),
                                  ));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width/2.6,
                                  margin: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                                  padding: const EdgeInsets.symmetric(vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                        )
                                      ],
                                    ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      CircleAvatar(
                                        radius: 30,
                                        backgroundImage: AssetImage("images/${doctors[index]}"),
                                      ),
                                      Center(
                                        child: Text(
                                          name[index],
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black
                                          ),
                                        ),
                                      ),
                                      Text(
                                        hospital[index],
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black54,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 18,
                                          ),
                                          const SizedBox(width: 5),
                                          Text(
                                              rating [index],
                                            style: const TextStyle(
                                              color: Colors.black54,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(CupertinoIcons.archivebox,
                                size: 30,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10),
                                child: Text("Articles",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index){
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height/10,
                                    margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 4,
                                          spreadRadius: 2,
                                        )
                                      ]
                                    ),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(left: 15, top: 12.5),
                                                child: Image.asset("images/articles.png",
                                                  width: 55,
                                                  height: 55,
                                                ),
                                              ),
                                              const SizedBox(width: 10),
                                              const Text(
                                                  "lorem ipsum dolor sit amet lorem sittt")
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        )
                      ],
                    ),
                    ),
                ],
              ),
            )
        )
    );
  }
}

