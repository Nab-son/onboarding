import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/firebase_options.dart';

class FirebaseService {
  static bool _initialized = false;
  
  static Future<void> initialize() async {
    if (_initialized) return;
    
    try {
      await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      );
      _initialized = true;
      print('Firebase initialized successfully');
    } catch (e) {
      print('Firebase initialization error: $e');
      throw e;
    }
  }

  static FirebaseFirestore get firestore {
    if (!_initialized) {
      throw Exception('Firebase not initialized. Call initialize() first.');
    }
    return FirebaseFirestore.instance;
  }
}