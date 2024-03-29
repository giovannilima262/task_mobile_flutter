import 'dart:convert';

class TaskModel {
  TaskModel({
    this.id,
    required this.title,
    required this.description,
  });

  String? id;
  String title;
  String description;

  TaskModel copyWith({
    String? id,
    String? title,
    String? description,
  }) {
    return TaskModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  Map<String, dynamic> toMapCreate() {
    return {
      'title': title,
      'description': description,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id']?.toString() ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TaskModel.fromJson(String source) =>
      TaskModel.fromMap(json.decode(source));
}
