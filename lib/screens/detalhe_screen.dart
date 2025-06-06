import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart'; // 1. CORREÇÃO: A importação correta do pacote.

import '../../models/filme.dart';

class DetalheScreen extends StatelessWidget {
  final Filme filme;
  const DetalheScreen({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
            'Detalhes',
            style: TextStyle(
                fontWeight: FontWeight.bold
            )
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    filme.imagemUrl,
                    errorBuilder:
                        (context, error, stackTrace) => Column(
                      children: [
                        const Icon(Icons.broken_image, size: 100, color: Colors.grey),
                        const SizedBox(height: 8),
                        const Text(
                          'Imagem não disponível',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      filme.titulo,
                      style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Text(
                    '${filme.ano}',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    filme.genero,
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                  ),
                  Text(
                    filme.faixaEtaria,
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    filme.duracao,
                    style: GoogleFonts.poppins(fontSize: 12, color: Colors.grey[600]),
                  ),
                  RatingBarIndicator(
                    rating: filme.pontuacao,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 22.0,
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Text(
                filme.descricao,
                style: GoogleFonts.poppins(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}