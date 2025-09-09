import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/core/constant/app_constant.dart';
import 'package:test/domaine/entities/toto_entities.dart';
import '../models/todo_model.dart';
/*import '../../domain/entities/todo_entity.dart';
import '../../core/constants/app_constants.dart';*/

class TodoRepository {
  final FirebaseFirestore _firestore;

  TodoRepository(this._firestore);

  CollectionReference get _collection => _firestore.collection(AppConstants.todosCollection);

  Stream<List<TodoEntity>> getTodos() {
    return _collection
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => TodoModel.fromFirestore(doc).toEntity())
            .toList());
  }

  Future<void> addTodo(TodoEntity todo) async {
    final model = TodoModel.fromEntity(todo);
    await _collection.add(model.toMap());
  }

  Future<void> updateTodo(TodoEntity todo) async {
    final model = TodoModel.fromEntity(todo);
    await _collection.doc(todo.id).update(model.toMap());
  }

  Future<void> deleteTodo(String id) async {
    await _collection.doc(id).delete();
  }
}