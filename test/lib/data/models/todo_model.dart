import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/domaine/entities/toto_entities.dart';

class TodoModel {
  final String id;
  final String title;
  final bool isCompleted;
  final DateTime createdAt;

  TodoModel({
    required this.id,
    required this.title,
    required this.isCompleted,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'isCompleted': isCompleted,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  factory TodoModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TodoModel(
      id: doc.id,
      title: data['title'] ?? '',
      isCompleted: data['isCompleted'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
    );
  }

  TodoEntity toEntity() {
    return TodoEntity(
      id: id,
      title: title,
      isCompleted: isCompleted,
      createdAt: createdAt,
    );
  }

  static TodoModel fromEntity(TodoEntity entity) {
    return TodoModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
      createdAt: entity.createdAt,
    );
  }
}