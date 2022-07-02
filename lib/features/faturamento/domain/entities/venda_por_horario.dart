import 'package:json_annotation/json_annotation.dart';

class VendaPorHorario {
  @JsonKey(name: 'id_loja')
  final int idLoja;

  final String loja;

  @JsonKey(name: 'quantidade_total', defaultValue: 0, fromJson: readInt)
  final int quantidade;

  @JsonKey(name: 'preco_total', defaultValue: 0, fromJson: readDouble)
  final double preco;

  @JsonKey(name: 'pessoas_atendidas_total', defaultValue: 0, fromJson: readInt)
  final int pessoasAtentidas;

  final DateTime data;

  VendaPorHorario(
    this.idLoja,
    this.loja,
    this.quantidade,
    this.preco,
    this.pessoasAtentidas,
    this.data,
  );

  static int readInt(String value) => int.parse(value);
  static double readDouble(String value) => double.parse(value);
}
