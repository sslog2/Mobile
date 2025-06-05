import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/filme.dart';

class DBHelper {
  static const String boxName = 'filmes';

  static Future<void> init() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter(FilmeAdapter());
    }
    await Hive.openBox<Filme>(boxName);
  }

  Future<int> insertFilme(Filme filme) async {
    final box = Hive.box<Filme>(boxName);
    int key = await box.add(filme);
    filme.id = key; // Atualiza o id do objeto
    await box.put(key, filme); // Garante que o id fique salvo
    return key;
  }

  Future<List<Filme>> getFilmes() async {
    final box = Hive.box<Filme>(boxName);
    // Associa a chave Hive ao campo id do objeto
    return box.keys.map((key) {
      final filme = box.get(key)!;
      filme.id = key;
      return filme;
    }).toList();
  }

  Future<void> updateFilme(Filme filme) async {
    final box = Hive.box<Filme>(boxName);
    if (filme.id != null) {
      await box.put(filme.id, filme);
    }
  }

  Future<void> deleteFilme(int id) async {
    final box = Hive.box<Filme>(boxName);
    await box.delete(id);
  }
}
