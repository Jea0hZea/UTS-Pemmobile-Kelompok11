import 'dart:async'; // Import package async untuk Timer
import 'package:quizz/views/home_screen.dart'; // Import halaman home
import 'package:quizz/views/results_screen.dart'; // Import halaman hasil
import 'package:flutter/cupertino.dart'; // Import Flutter Cupertino untuk ikon
import 'package:flutter/material.dart'; // Import Flutter Material untuk UI

// Kelas QuizScreen sebagai stateful widget
class QuizScreen extends StatefulWidget {
  final List<dynamic> questionlenght; // List pertanyaan
  final dynamic userName; // Nama pengguna
  const QuizScreen(
      {super.key, required this.questionlenght, required this.userName});

  @override
  State<QuizScreen> createState() => _QuizScreenState(); // Membuat state
}

// State untuk QuizScreen
class _QuizScreenState extends State<QuizScreen> {
  int questionTimerSeconds = 20; // Durasi timer pertanyaan
  Timer? _timer; // Timer untuk mengatur waktu
  int _questionNumber = 1; // Nomor pertanyaan
  PageController _controller = PageController(); // Controller untuk PageView
  int score = 0; // Skor
  bool isLocked = false; // Status kunci
  List optionsLetters = ["A.", "B.", "C.", "D.", "E."]; // Opsi huruf

  // Memulai timer pada pertanyaan
  void startTimerOnQuestions() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (mounted) {
        setState(() {
          if (questionTimerSeconds > 0) {
            questionTimerSeconds--;
          } else {
            _timer?.cancel();
            navigateToNewScreen(); // Pindah ke layar baru
          }
        });
      }
    });
  }

  // Menghentikan waktu
  void stopTime() {
    _timer?.cancel();
  }

  // Pindah ke layar baru
  void navigateToNewScreen() {
    if (_questionNumber < widget.questionlenght.length) {
      _controller.nextPage(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
      setState(() {
        _questionNumber++;
        isLocked = false;
      });
      _resetQuestionLocks(); // Reset kunci pertanyaan
      startTimerOnQuestions(); // Memulai timer pada pertanyaan
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsScreen(
            score: score,
            totalQuestions: widget.questionlenght.length,
          ),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0); // Set controller
    _resetQuestionLocks(); // Reset kunci pertanyaan
    startTimerOnQuestions(); // Memulai timer pada pertanyaan
  }

  @override
  void dispose() {
    _timer?.cancel(); // Batalkan timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color bgColor3 = Color(0xFF5170FD);
    const Color bgColor = Color(0xFF4993FA);

    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) {
        Navigator.popUntil(context, (route) => route.isFirst);
      },
      child: Scaffold(
        backgroundColor: bgColor3,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "${widget.userName}",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 14, bottom: 10),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          CupertinoIcons.clear,
                          color: Colors.white,
                          weight: 10,
                        ),
                      ),
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: LinearProgressIndicator(
                            minHeight: 20,
                            value: 1 - (questionTimerSeconds / 20),
                            backgroundColor: Colors.blue.shade100,
                            color: Colors.blueGrey,
                            valueColor: const AlwaysStoppedAnimation(bgColor),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 10, right: 10),
                  width: MediaQuery.of(context).size.width * 0.90,
                  height: MediaQuery.of(context).size.height * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.24),
                        blurRadius: 20.0,
                        offset: const Offset(0.0, 10.0),
                        spreadRadius: 10,
                      )
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Question $_questionNumber/${widget.questionlenght.length}",
                            style: TextStyle(
                                fontSize: 16, color: Colors.grey.shade500),
                          ),
                          Expanded(
                            child: PageView.builder(
                              controller: _controller,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: widget.questionlenght.length,
                              onPageChanged: (value) {
                                setState(() {
                                  _questionNumber = value + 1;
                                  isLocked = false;
                                  _resetQuestionLocks();
                                });
                              },
                              itemBuilder: (context, index) {
                                final myquestions =
                                    widget.questionlenght[index];

                                return Column(
                                  children: [
                                    // Widget untuk menampilkan gambar pertanyaan
                                    if(myquestions.pathAsset != "")
                                    Container(
                                        height: 100,
                                        margin: const EdgeInsets.all(6.0),
                                        child: Image.asset(myquestions.pathAsset),

                                    )
                                    ,
                                    // Text pertanyaan
                                    Text(
                                      myquestions.text,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            fontSize: 18,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    // Opsi jawaban
                                    Expanded(
                                      child: ListView.builder(
                                        itemCount: myquestions.options.length,
                                        itemBuilder: (context, index) {
                                          var color = Colors.grey.shade200;

                                          var questionOption =
                                              myquestions.options[index];
                                          final letters = optionsLetters[index];

                                          // Set warna opsi jawaban
                                          if (myquestions.isLocked) {
                                            if (questionOption ==
                                                myquestions
                                                    .selectedWiidgetOption) {
                                              color = questionOption.isCorrect
                                                  ? Colors.green
                                                  : Colors.red;
                                            } else if (questionOption
                                                .isCorrect) {
                                              color = Colors.green;
                                            }
                                          }
                                          return InkWell(
                                            onTap: () {
                                              stopTime(); // Hentikan waktu
                                              if (!myquestions.isLocked) {
                                                setState(() {
                                                  myquestions.isLocked = true;
                                                  myquestions
                                                          .selectedWiidgetOption =
                                                      questionOption;
                                                });

                                                isLocked = myquestions.isLocked;
                                                if (myquestions
                                                    .selectedWiidgetOption
                                                    .isCorrect) {
                                                  score++; // Tambahkan skor
                                                }
                                              }
                                            },
                                            child: Container(
                                              padding: const EdgeInsets.all(10),
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8),
                                              decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: color),
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    const BorderRadius.all(
                                                        Radius.circular(10)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "$letters ${questionOption.text}",
                                                      style: const TextStyle(
                                                          fontSize: 16),
                                                    ),
                                                  ),
                                                  // Tanda jawaban benar atau salah
                                                  isLocked == true
                                                      ? questionOption.isCorrect
                                                          ? const Icon(
                                                              Icons
                                                                  .check_circle,
                                                              color:
                                                                  Colors.green,
                                                            )
                                                          : const Icon(
                                                              Icons.cancel,
                                                              color: Colors.red,
                                                            )
                                                      : const SizedBox.shrink(),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          // Tombol untuk lanjut ke pertanyaan berikutnya
                          isLocked
                              ? buildElevatedButton()
                              : const SizedBox.shrink(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Reset kunci pertanyaan
  void _resetQuestionLocks() {
    for (var question in widget.questionlenght) {
      question.isLocked = false;
    }
    questionTimerSeconds = 20; // Reset timer
  }

  // Membuat tombol ElevatedButton
  ElevatedButton buildElevatedButton() {
    const Color cardColor = Color(0xFF4993FA);

    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(cardColor),
        fixedSize: MaterialStateProperty.all(
          Size(MediaQuery.sizeOf(context).width * 0.80, 40),
        ),
        elevation: MaterialStateProperty.all(4),
      ),
      onPressed: () {
        if (_questionNumber < widget.questionlenght.length) {
          _controller.nextPage(
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeInOut,
          );
          setState(() {
            _questionNumber++;
            isLocked = false;
          });
          _resetQuestionLocks(); // Reset kunci pertanyaan
          startTimerOnQuestions(); // Memulai timer pada pertanyaan
        } else {
          _timer?.cancel();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(
                score: score,
                totalQuestions: widget.questionlenght.length,
                userName: widget.userName
              ),
            ),
          );
        }
      },
      child: Text(
        _questionNumber < widget.questionlenght.length
            ? 'Next Question'
            : 'Result',
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
