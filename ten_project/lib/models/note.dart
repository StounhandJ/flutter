class Note {
  Note(
      {required this.name,
      required this.text,
      required this.category,
      this.id,
      required this.img,
      required this.metadata});

  String? id = "";
  String name = "";
  String text = "";
  String category = "";
  String? img = "";
  String? metadata = "";
}
