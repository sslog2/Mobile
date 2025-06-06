import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/filme.dart';
import '../../database/db_helper.dart';
import '../../utils/faixa_etaria.dart';

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  _CadastroScreenState createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  String imagemUrl = '';
  String titulo = '';
  String genero = '';
  String faixa = 'Livre';
  String duracao = '';
  double pontuacao = 3.0;
  String descricao = '';
  int ano = DateTime.now().year;

  void _salvar() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final novoFilme = Filme(
        imagemUrl: imagemUrl,
        titulo: titulo,
        genero: genero,
        faixaEtaria: faixa,
        duracao: duracao,
        pontuacao: pontuacao,
        descricao: descricao,
        ano: ano,
      );
      await DBHelper().insertFilme(novoFilme);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        title: Text(
          'Cadastrar Filme',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(decoration: InputDecoration(labelText: 'URL da Imagem'), onSaved: (v) => imagemUrl = v ?? ''),
              TextFormField(decoration: InputDecoration(labelText: 'Título'), validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null, onSaved: (v) => titulo = v ?? ''),
              TextFormField(decoration: InputDecoration(labelText: 'Gênero'), onSaved: (v) => genero = v ?? ''),
              DropdownButtonFormField<String>(
                value: faixa,
                items: faixaEtaria.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                onChanged: (v) => setState(() => faixa = v ?? 'Livre'),
                decoration: InputDecoration(labelText: 'Faixa Etária'),
              ),
              TextFormField(decoration: InputDecoration(labelText: 'Duração'), onSaved: (v) => duracao = v ?? ''),
              TextFormField(decoration: InputDecoration(labelText: 'Ano'), keyboardType: TextInputType.number, onSaved: (v) => ano = int.tryParse(v ?? '') ?? ano),
              TextFormField(decoration: InputDecoration(labelText: 'Descrição'), maxLines: 3, onSaved: (v) => descricao = v ?? ''),
              SizedBox(height: 16),
              Text('Avaliação'),
              RatingBar.builder(
                initialRating: pontuacao,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                onRatingUpdate: (rating) => pontuacao = rating,
                itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              ),
              SizedBox(height: 16),
              ElevatedButton(onPressed: _salvar, child: Text('Salvar')),
            ],
          ),
        ),
      ),
    );
  }
}
