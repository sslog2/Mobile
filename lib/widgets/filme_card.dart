import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../models/filme.dart';

class FilmeCard extends StatelessWidget {
  final Filme filme;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const FilmeCard({
    super.key,
    required this.filme,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        leading: Image.network(
          filme.imagemUrl,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Icon(Icons.broken_image, size: 40),
        ),
        title: Text(
          filme.titulo,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${filme.genero} • ${filme.ano}'),
            RatingBarIndicator(
              rating: filme.pontuacao,
              itemBuilder: (context, index) => Icon(Icons.star, color: Colors.amber),
              itemCount: 5,
              itemSize: 18.0,
              direction: Axis.horizontal,
            ),
          ],
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (value) {
            if (value == 'exibir' && onTap != null) {
              onTap!();
            } else if (value == 'alterar' && onLongPress != null) {
              onLongPress!();
            }
          },
          itemBuilder: (context) => [
            PopupMenuItem(value: 'exibir', child: Text('Detalhe')),
            PopupMenuItem(value: 'alterar', child: Text('Alterar')),
          ],
        ),
      ),
    );
  }
}
