import 'package:flutter/material.dart';
import 'database/db_helper.dart';
import '../screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DBHelper.init();
  runApp(FilmeApp());
}

class FilmeApp extends StatelessWidget {
  const FilmeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Filmes',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}