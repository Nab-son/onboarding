import 'package:flutter/material.dart';
import 'package:test/domaine/entities/toto_entities.dart';
import 'package:test/presentation/widgets/todo_item.dart' show TodoItem;
//import '../../domain/entities/todo_entity.dart';

class TodoList extends StatelessWidget {
  final List<TodoEntity> todos;
  final Function(TodoEntity) onToggle;
  final Function(String) onDelete;

  const TodoList({
    Key? key,
    required this.todos,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (todos.isEmpty) {
      return const Center(
        child: Text(
          'Aucune tâche à afficher\nAjoutez une nouvelle tâche!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18, color: Colors.grey),
        ),
      );
    }

    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) {
        final todo = todos[index];
        return TodoItem(
          todo: todo,
          onToggle: onToggle,
          onDelete: onDelete,
        );
      },
    );
  }
}