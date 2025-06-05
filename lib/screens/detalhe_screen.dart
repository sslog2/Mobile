import 'package:flutter/material.dart';
import '../../models/filme.dart';

class DetalheScreen extends StatelessWidget {
  final Filme filme;
  const DetalheScreen({required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filme.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(filme.imagemUrl, errorBuilder: (_, __, ___) => Icon(Icons.broken_image), height: 200),
            SizedBox(height: 16),
            Text(filme.descricao, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
