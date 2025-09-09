import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test/core/services/firebase_services.dart' show FirebaseService;
import 'package:test/data/repositories/todo_repositoti.dart';

/*import 'core/services/firebase_service.dart';
import 'data/repositories/todo_repository.dart';*/
import 'presentation/providers/todo_provider.dart';
import 'presentation/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<TodoRepository>(
          create: (_) => TodoRepository(FirebaseService.firestore),
        ),
        ChangeNotifierProvider(
          create: (context) => TodoProvider(
            context.read<TodoRepository>(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Todo App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}