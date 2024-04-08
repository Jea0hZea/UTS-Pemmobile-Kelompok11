// Import Flutter Material package untuk widget UI
import 'package:flutter/material.dart';

// Import halaman home dan widget kartu hasil
import 'package:quizz/views/home_screen.dart';
import 'package:quizz/widgets/results_card.dart';

// Kelas ResultsScreen sebagai StatelessWidget
class ResultsScreen extends StatelessWidget {
  // Konstruktor dengan parameter score, totalQuestions, dan userName
  const ResultsScreen(
      {super.key,
      required this.score,
      required this.totalQuestions, this.userName});
  final int score; // Skor
  final int totalQuestions; // Total pertanyaan
  final dynamic userName; // Nama pengguna

  // Build Method untuk menampilkan tampilan halaman hasil
  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    // Menghitung skor persentase dan membulatkannya
    final double percentageScore = (score / totalQuestions) * 100;
    final int roundedPercentageScore = percentageScore.round();
    const Color cardColor = Color(0xFF4993FA);

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        // Kembali ke halaman utama jika tombol kembali ditekan
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: bgColor3,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                // Kembali ke halaman utama jika tombol kembali ditekan
                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(
                                  ),
                                ),
                              );
              },
              icon: const Icon(
                Icons.close,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: bgColor3,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // Menampilkan pesan selamat dengan nama pengguna
                "Selamat $userName",
                style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                )
              ),
             
              // Widget kartu hasil untuk menampilkan skor persentase
              ResultsCard(
                  roundedPercentageScore: roundedPercentageScore,
                  bgColor3: bgColor3),
              const SizedBox(
                height: 25,
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(cardColor),
                  fixedSize: MaterialStateProperty.all(
                    Size(MediaQuery.sizeOf(context).width * 0.80, 40),
                  ),
                  elevation: MaterialStateProperty.all(4),
                ),
                onPressed: () {
                  // Kembali ke halaman utama jika tombol kembali ditekan
                  Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const HomePage(
                                  ),
                                ),
                              );
                },
                child: const Text(
                  // Teks untuk tombol kembali
                  "Kembali",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
