import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:map_launcher/map_launcher.dart';

class NotifToMapsScreen extends StatefulWidget {
  final RemoteMessage message;
  const NotifToMapsScreen({super.key, required this.message});
  static const route = '/notification_to_map';

  @override
  State<NotifToMapsScreen> createState() => _NotifToMapsScreenState();
}

class _NotifToMapsScreenState extends State<NotifToMapsScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  Future<void> goToMap() async {
    setState(() {
      isLoading = true;
    });
    final availableMaps = await MapLauncher.installedMaps;

    await availableMaps.first.showMarker(
      coords: Coords(double.parse(widget.message.data['lat']),
          double.parse(widget.message.data['long'])),
      title: widget.message.data['title'],
    );
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final message = widget.message;

    return Scaffold(
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Container(
              margin: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${message.notification!.body}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: Material(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(50),
                        child: InkWell(
                          onTap: isLoading
                              ? null
                              : goToMap, // Nonaktifkan tombol saat loading
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
                                      "Tunjukan Posisi",
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
                ],
              ),
            ),
    );
  }
}
