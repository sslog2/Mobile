import 'package:flutter/material.dart';
import '../../database/db_helper.dart';
import '../models/filme.dart';
import 'cadastro_screen.dart';
import 'detalhe_screen.dart';
import 'editar_screen.dart';
import '../../widgets/filme_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

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
  void _menuAction(String value, Filme filme) {
    if (value == 'exibir') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => DetalheScreen(filme: filme)));
    } else if (value == 'alterar') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => EditarScreen(filme: filme))).then((_) => _loadFilmes());
    }
  }
  void _showOptions(BuildContext context, Filme filme) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.visibility),
                title: const Text('Exibir Dados'),
                onTap: () {
                  Navigator.pop(context);
                  _menuAction('exibir', filme);
                },
              ),
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Alterar'),
                onTap: () {
                  Navigator.pop(context);
                  _menuAction('alterar', filme);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  void _showGrupo() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Grupo"),
        content: const Text("Integrantes: \nJosé Matheus Mendonça Farias\nMárcio Souto Maior Sousa\nJosé Liedson da Silva\nMaria Clara Lau Santos"),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("OK"))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: const Text('Filmes', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [IconButton(icon: const Icon(Icons.info), onPressed: _showGrupo)],
      ),
      body: ListView.builder(
        itemCount: filmes.length,
        itemBuilder: (context, index) {
          final filme = filmes[index];
          return Dismissible(
            key: Key(filme.id?.toString() ?? index.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            onDismissed: (_) async {
              if (filme.id != null) {
                await DBHelper().deleteFilme(filme.id!);
                _loadFilmes();
              }
            },
            child: FilmeCard(
              filme: filme,
              onTap: () => _showOptions(context, filme),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CadastroScreen())).then((_) => _loadFilmes()),
        child: const Icon(Icons.add),
      ),
    );
  }
}
