import 'package:flutter/material.dart';
import 'package:test/core/utls/extention.dart';
import 'package:test/domaine/entities/toto_entities.dart';
//import '../../domain/entities/todo_entity.dart';

class TodoItem extends StatelessWidget {
  final TodoEntity todo;
  final Function(TodoEntity) onToggle;
  final Function(String) onDelete;

  const TodoItem({
    Key? key,
    required this.todo,
    required this.onToggle,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(todo.id),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) => onDelete(todo.id),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmer'),
            content: const Text('Voulez-vous supprimer cette tâche?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text('Supprimer'),
              ),
            ],
          ),
        );
      },
      child: ListTile(
        leading: Checkbox(
          value: todo.isCompleted,
          onChanged: (_) => onToggle(todo),
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            decoration: todo.isCompleted ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'Créé le: ${todo.createdAt.toFormattedString()}',
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }
}