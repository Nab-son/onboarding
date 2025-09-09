import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test/core/constant/app_constant.dart';
import '../providers/todo_provider.dart';
import '../widgets/todo_list.dart';
import '../widgets/add_todo_dialog.dart';
//import '../../core/constants/app_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = Provider.of<TodoProvider>(context, listen: false);
      provider.loadTodos();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstants.appTitle),
        actions: [
          Consumer<TodoProvider>(
            builder: (context, provider, child) {
              return provider.isLoading
                  ? const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: Consumer<TodoProvider>(
        builder: (context, provider, child) {
          if (provider.error != null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    provider.error!,
                    style: const TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () => provider.loadTodos(),
                    child: const Text('Réessayer'),
                  ),
                ],
              ),
            );
          }

          return TodoList(
            todos: provider.todos,
            onToggle: (todo) => provider.toggleTodoCompletion(todo),
            onDelete: (id) => provider.deleteTodo(id),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AddTodoDialog(
              onAdd: (title) {
                final provider = Provider.of<TodoProvider>(context, listen: false);
                provider.addTodo(title);
              },
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}