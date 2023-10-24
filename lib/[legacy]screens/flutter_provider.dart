import 'package:flutter/foundation.dart';

class HomeScreenDataModel extends ChangeNotifier {
  String? userName;
  String? imageUrl;
  String? riskLevel;
  String? address;
  int latestAmplitude = 0;

  Future<void> fetchDataFromFirestore(String id) async {
    // Implementasikan logika untuk mengambil data dari Firestore
    // Kemudian, perbarui properti-properti di sini
    // ...
    notifyListeners(); // Panggil untuk memberi tahu perubahan data
  }

  // Buat metode lain sesuai kebutuhan Anda
}
