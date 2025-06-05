// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filme.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FilmeAdapter extends TypeAdapter<Filme> {
  @override
  final int typeId = 0;

  @override
  Filme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Filme(
      id: fields[0] as int?,
      imagemUrl: fields[1] as String,
      titulo: fields[2] as String,
      genero: fields[3] as String,
      faixaEtaria: fields[4] as String,
      duracao: fields[5] as String,
      pontuacao: fields[6] as double,
      descricao: fields[7] as String,
      ano: fields[8] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Filme obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.imagemUrl)
      ..writeByte(2)
      ..write(obj.titulo)
      ..writeByte(3)
      ..write(obj.genero)
      ..writeByte(4)
      ..write(obj.faixaEtaria)
      ..writeByte(5)
      ..write(obj.duracao)
      ..writeByte(6)
      ..write(obj.pontuacao)
      ..writeByte(7)
      ..write(obj.descricao)
      ..writeByte(8)
      ..write(obj.ano);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FilmeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
