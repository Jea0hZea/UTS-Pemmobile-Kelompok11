import 'package:flutter/material.dart';
import 'package:quizz/widgets/dotted_lines.dart'; // Import widget DrawDottedhorizontalline

// Kelas ResultsCard sebagai StatelessWidget untuk menampilkan kartu hasil
class ResultsCard extends StatelessWidget {
  const ResultsCard({
    super.key,
    required this.roundedPercentageScore,
    required this.bgColor3,
  });

  // Variabel yang menyimpan nilai persentase hasil yang dibulatkan dan warna latar belakang
  final int roundedPercentageScore;
  final Color bgColor3;

  // Method untuk membangun tampilan widget
  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD); // Warna latar belakang kartu hasil

    // Widget SizedBox untuk menentukan ukuran kartu hasil
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.888,
      height: MediaQuery.of(context).size.height * 0.568,
      child: Stack(
        children: [
          // Widget Card sebagai latar belakang kartu hasil
          Card(
            color: Colors.white, // Warna latar belakang kartu
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0), // Bentuk border radius
            ),
            elevation: 5, // Efek elevasi kartu
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Padding di dalam kartu
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            // Menampilkan nilai persentase hasil
                            TextSpan(
                              text: "$roundedPercentageScore%",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(fontSize: 30), // Gaya teks
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  CustomPaint(
                    painter: DrawDottedhorizontalline(), // Widget untuk menggambar garis putus-putus
                  ),
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 25), // Padding di atas gambar
                        child: roundedPercentageScore >= 75
                            ? Column(
                                children: [
                                  // Pesan dan gambar jika hasil bagus
                                  Text(
                                    "You have Earned this Trophy",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                  Image.asset(
                                    "assets/bouncy-cup.gif", // Gambar trofi
                                    fit: BoxFit.fill, // Penyesuaian ukuran gambar
                                    height: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.25, // Tinggi gambar
                                  ),
                                ],
                              )
                            : Column(
                                children: [
                                  // Pesan dan gambar jika hasil kurang memuaskan
                                  Text(
                                    "I know You can do better!!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          fontWeight: FontWeight.w600,
                                        ),
                                  ),
                                  Image.asset(
                                    "assets/sad.png", // Gambar emotikon sedih
                                    fit: BoxFit.fill, // Penyesuaian ukuran gambar
                                    height: MediaQuery.of(context)
                                            .size
                                            .height *
                                        0.25, // Tinggi gambar
                                  ),
                                ],
                              ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            left: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: bgColor3, shape: BoxShape.circle), // Lingkaran kiri
            ),
          ),
          Positioned(
            right: -10,
            top: MediaQuery.of(context).size.height * 0.178,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                  color: bgColor3, shape: BoxShape.circle), // Lingkaran kanan
            ),
          ),
        ],
      ),
    );
  }
}
