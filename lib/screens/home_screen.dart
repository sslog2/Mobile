import 'package:flutter/material.dart';
import '../../database/db_helper.dart';
import '../models/filme.dart';
import 'cadastro_screen.dart';
import 'detalhe_screen.dart';
import 'editar_screen.dart';
import '../../widgets/filme_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Filme> filmes = [];

  @override
  void initState() {
    super.initState();
    _loadFilmes();
  }

  Future<void> _loadFilmes() async {
    final data = await DBHelper().getFilmes();
    setState(() {
      filmes = data;
    });
  }

  void _showGrupo() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Grupo"),
        content: Text("Integrantes: Matheus Farias, Marcio Souto, Liedson, Maria Clara."),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text("OK"))],
      ),
    );
  }

  void _menuAction(String value, Filme filme) {
    if (value == 'exibir') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => DetalheScreen(filme: filme)));
    } else if (value == 'alterar') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditarScreen(filme: filme))).then((_) => _loadFilmes());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filmes'),
        actions: [
          IconButton(icon: Icon(Icons.info), onPressed: _showGrupo),
        ],
      ),
      body: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];
          return Dismissible(
            key: Key(filme.id?.toString() ?? index.toString()),
            background: Container(color: Colors.red, alignment: Alignment.centerLeft, padding: EdgeInsets.only(left: 20), child: Icon(Icons.delete, color: Colors.white)),
            onDismissed: (_) async {
              if (filme.id != null) {
                await DBHelper().deleteFilme(filme.id!);
                _loadFilmes();
              }
            },
            child: FilmeCard(
              filme: filme,
              onTap: () => _menuAction('exibir', filme),
              onLongPress: () => _menuAction('alterar', filme),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CadastroScreen())).then((_) => _loadFilmes()),
        child: Icon(Icons.add),
      ),
    );
  }
}
