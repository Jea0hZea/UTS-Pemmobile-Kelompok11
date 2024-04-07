class QuizModel {
  int id;
  String text;
  String pathAsset;
  List<OptionsModel> options;
  bool isLocked;
  OptionsModel? selectedWiidgetOption;
  

  QuizModel({
    required this.id,
    required this.text,
    required this.pathAsset,
    required this.options,
    this.isLocked = false,
    this.selectedWiidgetOption
  });
}

class OptionsModel {
  final String text;
  final bool isCorrect;

  const OptionsModel({
    required this.text,
    required this.isCorrect,
  });
}
