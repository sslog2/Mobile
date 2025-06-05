import 'package:hive/hive.dart';

part 'filme.g.dart';

@HiveType(typeId: 0)
class Filme {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String imagemUrl;
  @HiveField(2)
  String titulo;
  @HiveField(3)
  String genero;
  @HiveField(4)
  String faixaEtaria;
  @HiveField(5)
  String duracao;
  @HiveField(6)
  double pontuacao;
  @HiveField(7)
  String descricao;
  @HiveField(8)
  int ano;

  Filme({
    this.id,
    required this.imagemUrl,
    required this.titulo,
    required this.genero,
    required this.faixaEtaria,
    required this.duracao,
    required this.pontuacao,
    required this.descricao,
    required this.ano,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'imagemUrl': imagemUrl,
      'titulo': titulo,
      'genero': genero,
      'faixaEtaria': faixaEtaria,
      'duracao': duracao,
      'pontuacao': pontuacao,
      'descricao': descricao,
      'ano': ano,
    };
  }

  factory Filme.fromMap(Map<String, dynamic> map) {
    return Filme(
      id: map['id'],
      imagemUrl: map['imagemUrl'],
      titulo: map['titulo'],
      genero: map['genero'],
      faixaEtaria: map['faixaEtaria'],
      duracao: map['duracao'],
      pontuacao: map['pontuacao'],
      descricao: map['descricao'],
      ano: map['ano'],
    );
  }
}
