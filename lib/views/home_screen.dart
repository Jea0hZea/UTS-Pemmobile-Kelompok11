// Import paket yang diperlukan
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:quizz/controller/naviagation_questions_model.dart';
import 'package:quizz/views/quiz_screen.dart';

// Kelas HomePage
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

// State untuk HomePage
class _HomePageState extends State<HomePage> {
  final QuizController quizController = QuizController(); // Inisialisasi QuizController
  final textFieldController = TextEditingController(); // Controller untuk TextField
  late String userName;

  @override
  Widget build(BuildContext context) {
    setData(quizController); // Set data quiz

    // Mendapatkan pertanyaan acak
    List<dynamic> randomQuestions = getRandomQuestionsAndOptions(
      quizController.quizzes,
      quizController.totalQuizzes,
    ).keys.toList();

    // Warna latar belakang
    const Color bgColor = Color.fromARGB(255, 86, 228, 9);
    const Color bgColor3 = Color.fromARGB(255, 6, 147, 22);

    return Scaffold(
      backgroundColor: bgColor3, // Set latar belakang
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 0, left: 15, right: 15),
                child: ListView(
                  physics: const BouncingScrollPhysics(),
                  children: [
                    Container(
                      // Widget untuk menampilkan gambar
                      decoration: BoxDecoration(
                        color: bgColor3,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.24),
                            blurRadius: 20.0,
                            offset: const Offset(0.0, 10.0),
                            spreadRadius: -10,
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                      ),
                      child: Image.asset("assets/dash.png"),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Widget untuk judul aplikasi
                    Center(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Flutter ",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall!
                                  .copyWith(
                                    fontSize: 21,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            for (var i = 0; i < "Quizz!!!".length; i++) ...[
                              TextSpan(
                                text: "Quizz!!!"[i],
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 21 + i.toDouble(),
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                            ]
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Widget untuk input username
                    Card(
                      color: bgColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "username : ",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                    ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              // TextField untuk input username
                              TextField(
                                controller: textFieldController,
                                style: const TextStyle(color: Colors.white),
                                decoration: const InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white54, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.white54, width: 1.0),
                                  ),
                                  hintText: 'Masukkan Username',
                                  hintStyle:
                                      TextStyle(color: Colors.white54),
                                ),
                                cursorColor: Colors.white,
                              ),
                              // Tombol untuk memulai kuis
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                        builder: (context) => QuizScreen(
                                          questionlenght: randomQuestions,
                                          userName: textFieldController.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: const Text("Start Question"))
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Tombol "Hubungi Kami"
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Tambahkan fungsi untuk menangani aksi ketika tombol "Hubungi Kami" ditekan
                },
                child: const Text("Hubungi Kami"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Fungsi untuk mendapatkan pertanyaan dan opsi secara acak
Map<dynamic, dynamic> getRandomQuestionsAndOptions(
  List<dynamic> allQuestions,
  int count,
) {
  final randomQuestions = <dynamic>[];
  final randomOptions = <dynamic>[];
  final random = Random();

  // Jika jumlah pertanyaan melebihi total pertanyaan yang tersedia
  if (count >= allQuestions.length) {
    count = allQuestions.length;
  }

  // Memilih pertanyaan secara acak
  while (randomQuestions.length < count) {
    final randomIndex = random.nextInt(allQuestions.length);
    final selectedQuestion = allQuestions[randomIndex];

    if (!randomQuestions.contains(selectedQuestion)) {
      randomQuestions.add(selectedQuestion);
      randomOptions.add(selectedQuestion.options);
    }
  }

  return Map.fromIterables(randomQuestions, randomOptions);
}
