import 'package:flutter/material.dart';
import '../../models/filme.dart';

class DetalheScreen extends StatelessWidget {
  final Filme filme;
  const DetalheScreen({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(filme.titulo)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              filme.imagemUrl,
              errorBuilder:
                  (context, error, stackTrace) => Column(
                    children: [
                      Icon(Icons.broken_image, size: 100, color: Colors.grey),
                      SizedBox(height: 8),
                      Text(
                        'Imagem não disponível',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
              height: 200,
            ),
            SizedBox(height: 16),
            Text(
              'Gênero: ${filme.genero}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text('Ano: ${filme.ano}', style: TextStyle(fontSize: 16)),
            Text('Duração: ${filme.duracao}', style: TextStyle(fontSize: 16)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber),
                SizedBox(width: 4),
                Text('${filme.pontuacao}', style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 16),
            Text(filme.descricao, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
