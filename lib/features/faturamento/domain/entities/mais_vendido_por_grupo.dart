import 'package:json_annotation/json_annotation.dart';

class MaisVendidoPorGrupo {
  @JsonKey(name: 'id_loja')
  final int idLoja;

  final String loja;

  @JsonKey(name: 'id_grupo')
  final int idGrupo;

  final String grupo;

  @JsonKey(name: 'quantidade_total', defaultValue: 1, fromJson: readDouble)
  final double quantidadeTotal;

  @JsonKey(name: 'valor_total', defaultValue: 0, fromJson: readDouble)
  final double valorTotal;

  @JsonKey(name: 'porcentagem', defaultValue: 0, fromJson: readDouble)
  final double percentual;

  MaisVendidoPorGrupo(
    this.idLoja,
    this.loja,
    this.idGrupo,
    this.grupo,
    this.quantidadeTotal,
    this.valorTotal,
    this.percentual,
  );

  double get percentualLegivel => percentual * 100;

  static double readDouble(String value) => double.parse(value);
}
