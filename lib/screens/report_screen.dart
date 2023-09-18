import 'package:flutter/material.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  Icon(Icons.bar_chart,
                    size: 26,
                    color: Colors.black,),
                  SizedBox(width: 5),
                  Text(
                    "Report",
                    style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700
                    ),
                  ),
                ],
              ),
            ),
            // SizedBox(height: 20),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  Color.fromARGB(255, 236, 238, 255),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]
              ),

              child: SizedBox(

                width: MediaQuery.of(context).size.width,
                child:  Column(
                  children: [

                    const ListTile(
                      title: Text(
                        "69",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text(
                        "bpm",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Icon(Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                    const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("10/01/2023",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("15:19 WIB",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                           Container(
                             padding: const EdgeInsets.all(5),
                             decoration: const BoxDecoration(
                               color: Colors.red,
                               shape: BoxShape.circle,
                             ),
                           ),
                            const SizedBox(width: 5),
                            const Text("High risk",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  Color.fromARGB(255, 236, 238, 255),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]
              ),

              child: SizedBox(

                width: MediaQuery.of(context).size.width,
                child:  Column(
                  children: [

                    const ListTile(
                      title: Text(
                        "52",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text(
                        "bpm",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Icon(Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("10/01/2023",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("15:19 WIB",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text("High risk",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  Color.fromARGB(255, 236, 238, 255),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]
              ),

              child: SizedBox(

                width: MediaQuery.of(context).size.width,
                child:  Column(
                  children: [

                    const ListTile(
                      title: Text(
                        "69",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text(
                        "bpm",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Icon(Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("10/01/2023",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("15:19 WIB",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text("High risk",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  Color.fromARGB(255, 236, 238, 255),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]
              ),

              child: SizedBox(

                width: MediaQuery.of(context).size.width,
                child:  Column(
                  children: [

                    const ListTile(
                      title: Text(
                        "61",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text(
                        "bpm",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Icon(Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("10/01/2023",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("15:19 WIB",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text("High risk",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color:  Color.fromARGB(255, 236, 238, 255),
                      blurRadius: 4,
                      spreadRadius: 3,
                    )
                  ]
              ),

              child: SizedBox(

                width: MediaQuery.of(context).size.width,
                child:  Column(
                  children: [

                    const ListTile(
                      title: Text(
                        "52",
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      subtitle: Text(
                        "bpm",
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w500
                        ),
                      ),
                      trailing: Icon(Icons.calendar_today,
                        size: 40,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Divider(
                        thickness: 1,
                        height: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.calendar_month,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("10/01/2023",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        const Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.access_time_filled,
                              color: Colors.black54,
                            ),
                            SizedBox(width: 5),
                            Text("15:19 WIB",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(5),
                              decoration: const BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            const Text("High risk",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
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
    ),
    )
    );
  }
}