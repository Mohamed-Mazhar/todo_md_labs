import 'package:equatable/equatable.dart';

class TodoModel extends Equatable {
  final int? id;
  final bool isChecked;
  final String title;

  const TodoModel({
    this.id,
    required this.isChecked,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {'id': id, 'checked': isChecked ? 1 : 0, 'title': title};
  }

  TodoModel copyWith({
    int? id,
    bool? isChecked,
  }) {
    return TodoModel(
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      title: title,
    );
  }

  @override
  List<Object?> get props => [id, isChecked, title];
}
