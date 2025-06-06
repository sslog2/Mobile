import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../models/filme.dart';
import '../../database/db_helper.dart';
import '../../utils/faixa_etaria.dart';

class EditarScreen extends StatefulWidget {
  final Filme filme;
  const EditarScreen({super.key, required this.filme});
  @override
  _EditarScreenState createState() => _EditarScreenState();
}

class _EditarScreenState extends State<EditarScreen> {
  final _formKey = GlobalKey<FormState>();
  late String imagemUrl;
  late String titulo;
  late String genero;
  late String faixa;
  late String duracao;
  late double pontuacao;
  late String descricao;
  late int ano;

  @override
  void initState() {
    super.initState();
    imagemUrl = widget.filme.imagemUrl;
    titulo = widget.filme.titulo;
    genero = widget.filme.genero;
    faixa = widget.filme.faixaEtaria;
    duracao = widget.filme.duracao;
    pontuacao = widget.filme.pontuacao;
    descricao = widget.filme.descricao;
    ano = widget.filme.ano;
  }

  void _salvar() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final filmeEditado = Filme(
        id: widget.filme.id,
        imagemUrl: imagemUrl,
        titulo: titulo,
        genero: genero,
        faixaEtaria: faixa,
        duracao: duracao,
        pontuacao: pontuacao,
        descricao: descricao,
        ano: ano,
      );
      await DBHelper().updateFilme(filmeEditado);
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
          'Editar Filme',
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
              TextFormField(
                initialValue: imagemUrl,
                decoration: InputDecoration(labelText: 'URL da Imagem'),
                onSaved: (v) => imagemUrl = v ?? '',
              ),
              TextFormField(
                initialValue: titulo,
                decoration: InputDecoration(labelText: 'Título'),
                validator: (v) => v!.isEmpty ? 'Campo obrigatório' : null,
                onSaved: (v) => titulo = v ?? '',
              ),
              TextFormField(
                initialValue: genero,
                decoration: InputDecoration(labelText: 'Gênero'),
                onSaved: (v) => genero = v ?? '',
              ),
              DropdownButtonFormField<String>(
                value: faixa,
                items: faixaEtaria.map((f) => DropdownMenuItem(value: f, child: Text(f))).toList(),
                onChanged: (v) => setState(() => faixa = v ?? 'Livre'),
                decoration: InputDecoration(labelText: 'Faixa Etária'),
              ),
              TextFormField(
                initialValue: duracao,
                decoration: InputDecoration(labelText: 'Duração'),
                onSaved: (v) => duracao = v ?? '',
              ),
              TextFormField(
                initialValue: ano.toString(),
                decoration: InputDecoration(labelText: 'Ano'),
                keyboardType: TextInputType.number,
                onSaved: (v) => ano = int.tryParse(v ?? '') ?? ano,
              ),
              TextFormField(
                initialValue: descricao,
                decoration: InputDecoration(labelText: 'Descrição'),
                maxLines: 3,
                onSaved: (v) => descricao = v ?? '',
              ),
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
              ElevatedButton(onPressed: _salvar, child: Text('Salvar Alterações')),
            ],
          ),
        ),
      ),
    );
  }
}
