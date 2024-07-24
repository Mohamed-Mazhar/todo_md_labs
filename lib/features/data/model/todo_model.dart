class TodoModel {
  final int id;
  final bool isChecked;
  final String title;

  TodoModel({
    required this.id,
    required this.isChecked,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'checked': isChecked,
      'title': title
    };
  }

}
