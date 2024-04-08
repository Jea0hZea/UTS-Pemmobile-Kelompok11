import 'package:quizz/models/quiz_model.dart';

class QuizController {
  List<QuizModel> _quizzes = []; // List untuk menyimpan objek-objek QuizModel

  // Getter untuk mendapatkan daftar quizzes
  List<QuizModel> get quizzes => _quizzes;

  // Setter untuk mengatur daftar quizzes
  set quizzes(List<QuizModel> value) {
    _quizzes = value;
  }

  void delete() {
    _quizzes.clear();
  }

  // Metode untuk mendapatkan jumlah total quiz
  int get totalQuizzes => _quizzes.length;

  // Metode untuk mendapatkan quiz berdasarkan indeks
  QuizModel getQuizAtIndex(int index) {
    if (index >= 0 && index < _quizzes.length) {
      return _quizzes[index];
    } else {
      throw Exception('Index out of bounds');
    }
  }
}

// Setter untuk mengisi data ke dalam QuizController
void setData(QuizController quizController) {
  quizController.delete();

  // Pertanyaan 1
  List<OptionsModel> options1 = [
    const OptionsModel(
        text: "Hafizhuddin Zul Fahmi, S.Kom., M.Sc.", isCorrect: false),
    const OptionsModel(
        text: "Dodik Arwin Dermawan, S.ST., S.T., M.T", isCorrect: true),
    const OptionsModel(
        text: "I Gde Agung Sri Sidhimantra, S.Kom., M.Kom.", isCorrect: false),
    const OptionsModel(text: "Prof. Dr. Eko K. Budiardjo", isCorrect: false),
    const OptionsModel(text: "Andi Iwan Nurhidayat, S.Kom., M.T.", isCorrect: false),
  ];
  QuizModel quiz1 = QuizModel(
      id: 1,
      text: "Siapakah nama dosen kaprodi ?",
      pathAsset: "",
      options: options1);
  quizController.quizzes.add(quiz1);

  // Pertanyaan 2
  List<OptionsModel> options2 = [
    const OptionsModel(
        text: "Hafizhuddin Zul Fahmi, S.Kom., M.Sc.", isCorrect: true),
    const OptionsModel(
        text: "Dodik Arwin Dermawan, S.ST., S.T., M.T", isCorrect: false),
    const OptionsModel(
        text: "I Gde Agung Sri Sidhimantra, S.Kom., M.Kom.", isCorrect: false),
    const OptionsModel(text: "Prof. Dr. Eko K. Budiardjo", isCorrect: false),
    const OptionsModel(
        text: "Andi Iwan Nurhidayat, S.Kom., M.T.", isCorrect: false),
  ];
  QuizModel quiz2 = QuizModel(
      id: 2,
      text:
          "Saya adalah dosen pengajar statistika pada semester 4 angkatan 2022. Siapakah saya ?",
      pathAsset: "",
      options: options2);
  quizController.quizzes.add(quiz2);

  // Pertanyaan 3
  List<OptionsModel> options3 = [
    const OptionsModel(text: "Teknik", isCorrect: false),
    const OptionsModel(text: "Kedokteran", isCorrect: false),
    const OptionsModel(text: "Ilmu Pendidikan", isCorrect: false),
    const OptionsModel(text: "Hukum", isCorrect: false),
    const OptionsModel(text: "Vokasi", isCorrect: true),
  ];
  QuizModel quiz3 = QuizModel(
      id: 3,
      text:
          "D4 Manajemen Informatika masuk dalam sebuah prodi didalam suatu fakultas ?",
      pathAsset: "",
      options: options3);
  quizController.quizzes.add(quiz3);

  // Pertanyaan 4
  List<OptionsModel> options4 = [
    const OptionsModel(text: "Gedung Rektorat", isCorrect: true),
    const OptionsModel(text: "Gedung K10", isCorrect: false),
    const OptionsModel(text: "Gedung Asrama", isCorrect: false),
    const OptionsModel(text: "Aula Unesa", isCorrect: false),
    const OptionsModel(text: "Graha Unesa", isCorrect: false),
  ];
  QuizModel quiz4 = QuizModel(
      id: 4,
      text:
          "Gedung yang cukup ikonik di Unesa yang terletak di Lidah Wetan adalah ?",
      pathAsset: "",
      options: options4);
  quizController.quizzes.add(quiz4);

  // Pertanyaan 5
  List<OptionsModel> options5 = [
    const OptionsModel(text: "Java", isCorrect: false),
    const OptionsModel(text: "Phyton", isCorrect: true),
    const OptionsModel(text: "C++", isCorrect: false),
    const OptionsModel(text: "Ruby", isCorrect: false),
    const OptionsModel(text: "Pascal", isCorrect: false),
  ];
  QuizModel quiz5 = QuizModel(
      id: 5,
      text:
          "Salah satu bahasa pemograman yang cukup simpel di antara beberapa pilihan tersebut adalah ?",
      pathAsset: "",
      options: options5);
  quizController.quizzes.add(quiz5);

  // Pertanyaan 6
  List<OptionsModel> options6 = [
    const OptionsModel(
        text: "Hafizhuddin Zul Fahmi, S.Kom., M.Sc.", isCorrect: false),
    const OptionsModel(
        text: "Dodik Arwin Dermawan, S.ST., S.T., M.T", isCorrect: false),
    const OptionsModel(
        text: "I Gde Agung Sri Sidhimantra, S.Kom., M.Kom.", isCorrect: false),
    const OptionsModel(text: "Prof. Dr. Eko K. Budiardjo", isCorrect: false),
    const OptionsModel(
        text: "Andi Iwan Nurhidayat, S.Kom., M.T.", isCorrect: true),
  ];
  QuizModel quiz6 = QuizModel(
      id: 6,
      text:
          "Siapakah dosen yang mengajar 3 mata kuliah di semester 4 untuk angkatan 2022 kelas B ?",
      pathAsset: "",
      options: options6);
  quizController.quizzes.add(quiz6);

  // Pertanyaan 7
  List<OptionsModel> options7 = [
    const OptionsModel(text: "2019", isCorrect: true),
    const OptionsModel(text: "2020", isCorrect: false),
    const OptionsModel(text: "2017", isCorrect: false),
    const OptionsModel(text: "2021", isCorrect: false),
    const OptionsModel(text: "2018", isCorrect: false),
  ];
  QuizModel quiz7 = QuizModel(
      id: 7,
      text: "Kapan Manajemen Informatika pindah dari D3 menjadi D4 ?",
      pathAsset: "",
      options: options7);
  quizController.quizzes.add(quiz7);

  // Pertanyaan 8
  List<OptionsModel> options8 = [
    const OptionsModel(
        text: "Kepala rektor", isCorrect: false),
    const OptionsModel(
        text: "Asisten Dosen", isCorrect: false),
    const OptionsModel(
        text: "Dosen kaprodi", isCorrect: false),
    const OptionsModel(text: "Dosen mata kuliah masing-masing", isCorrect: false),
    const OptionsModel(
        text: "Dosen wali", isCorrect: true),
  ];
  QuizModel quiz8 = QuizModel(
      id: 8, text: "Siapakah dosen yang perlu dihubungi untuk aprove KRS ?",
      pathAsset: "",
      options: options8);
  quizController.quizzes.add(quiz8);

  // Pertanyaan 9
  List<OptionsModel> options9 = [
    const OptionsModel(text: "11", isCorrect: false),
    const OptionsModel(text: "9", isCorrect: false),
    const OptionsModel(text: "12", isCorrect: true),
    const OptionsModel(text: "8", isCorrect: false),
    const OptionsModel(text: "10", isCorrect: false),
  ];
  QuizModel quiz9 = QuizModel(
      id: 9,
      text: "Ada berapa mata kuliah di semester 4 untuk angkatan 2022 ?",
      pathAsset: "",
      options: options9);
  quizController.quizzes.add(quiz9);

  // Pertanyaan 10
  List<OptionsModel> options10 = [
    const OptionsModel(text: "Algoritma Pemrograman", isCorrect: false),
    const OptionsModel(text: "Matematika diskrit", isCorrect: false),
    const OptionsModel(text: "UI/UX", isCorrect: true),
    const OptionsModel(text: "Jaringan Komputer", isCorrect: false),
    const OptionsModel(text: "Literasi Digital", isCorrect: false),
  ];
  QuizModel quiz10 = QuizModel(
      id: 10,
      text: "Berikut Yang merupakan mata kuliah di semester 4 untuk angkatan 2022 adalah ?",
      pathAsset: "",
      options: options10);
  quizController.quizzes.add(quiz10);
}
