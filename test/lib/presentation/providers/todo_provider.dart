import 'package:flutter/foundation.dart';
import 'package:test/data/repositories/todo_repositoti.dart';
import 'package:test/domaine/entities/toto_entities.dart';
/*import '../../domain/entities/todo_entity.dart';
import '../../data/repositories/todo_repository.dart';*/

class TodoProvider with ChangeNotifier {
  final TodoRepository _repository;
  List<TodoEntity> _todos = [];
  bool _isLoading = false;
  String? _error;

  TodoProvider(this._repository);

  List<TodoEntity> get todos => _todos;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> loadTodos() async {
    _setLoading(true);
    _error = null;

    try {
      _repository.getTodos().listen((todos) {
        _todos = todos;
        _setLoading(false);
        notifyListeners();
      }, onError: (error) {
        _error = 'Erreur de chargement: $error';
        _setLoading(false);
        notifyListeners();
      });
    } catch (e) {
      _error = 'Erreur: $e';
      _setLoading(false);
      notifyListeners();
    }
  }

  Future<void> addTodo(String title) async {
    if (title.isEmpty) return;
    
    final newTodo = TodoEntity(
      id: '',
      title: title,
      isCompleted: false,
      createdAt: DateTime.now(),
    );
    
    try {
      await _repository.addTodo(newTodo);
    } catch (e) {
      _error = 'Erreur lors de l\'ajout: $e';
      notifyListeners();
    }
  }

  Future<void> toggleTodoCompletion(TodoEntity todo) async {
    final updatedTodo = todo.copyWith(isCompleted: !todo.isCompleted);
    
    try {
      await _repository.updateTodo(updatedTodo);
    } catch (e) {
      _error = 'Erreur lors de la mise à jour: $e';
      notifyListeners();
    }
  }

  Future<void> deleteTodo(String id) async {
    try {
      await _repository.deleteTodo(id);
    } catch (e) {
      _error = 'Erreur lors de la suppression: $e';
      notifyListeners();
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}