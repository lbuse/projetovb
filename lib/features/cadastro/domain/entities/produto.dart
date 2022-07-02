import 'package:json_annotation/json_annotation.dart';

class Produto {
  final int id;

  @JsonKey(name: 'id_grupo')
  final int idGrupo;

  final String nome;

  Produto(
    this.id,
    this.idGrupo,
    this.nome,
  );
}
