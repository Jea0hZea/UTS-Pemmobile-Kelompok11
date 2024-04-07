import 'dart:async'; // Import paket async untuk mengatur waktu
import 'package:flutter/material.dart'; // Import paket Flutter untuk widget UI
import 'package:quizz/views/quiz_screen.dart'; // Import file QuizScreen untuk navigasi

// Kelas MyProgressIndicator sebagai StatefulWidget untuk menampilkan indikator progres
class MyProgressIndicator extends StatefulWidget {
  // Konstruktor dengan parameter yang dibutuhkan
  final List<dynamic> questionlenght;
  final dynamic userName;
  const MyProgressIndicator({
    super.key,
    required this.questionlenght,
    required this.userName,
  });

  // Method untuk membuat state dari widget
  @override
  State<MyProgressIndicator> createState() => _MyProgressIndicatorState();
}

// Kelas _MyProgressIndicatorState sebagai State dari MyProgressIndicator
class _MyProgressIndicatorState extends State<MyProgressIndicator> {
  // Variabel untuk menyimpan detik dalam timer
  int timerSeconds = 45;
  Timer? _timer; // Variabel untuk menyimpan objek Timer

  // Method yang dipanggil saat widget pertama kali dibuat
  @override
  void initState() {
    super.initState();
    startTimer(); // Panggil method untuk memulai timer
  }

  // Method untuk memulai timer
  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (timerSeconds > 0) {
          timerSeconds--; // Kurangi nilai detik
        } else {
          _timer?.cancel(); // Hentikan timer jika detik mencapai 0
          navigateToNewScreen(); // Panggil method untuk navigasi ke layar baru
        }
      });
    });
  }

  // Method untuk navigasi ke layar baru (QuizScreen)
  void navigateToNewScreen() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => QuizScreen(
          questionlenght: widget.questionlenght,
          userName: widget.userName,
        ),
      ),
    );
  }

  // Method yang dipanggil saat widget dihapus dari pohon widget
  @override
  void dispose() {
    _timer?.cancel(); // Hentikan timer saat widget dihapus
    super.dispose();
  }

  // Method untuk membangun tampilan widget
  @override
  Widget build(BuildContext context) {
    const Color bgColor = Color(0xFF4993FA); // Warna latar belakang indikator progres
    return Expanded(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        // Widget LinearProgressIndicator untuk menampilkan indikator progres linear
        child: LinearProgressIndicator(
          minHeight: 20,
          value: 1 - (timerSeconds / 45), // Nilai progres berdasarkan detik
          backgroundColor: Colors.blue.shade100,
          color: Colors.blueGrey,
          valueColor: const AlwaysStoppedAnimation(bgColor),
        ),
      ),
    );
  }
}
