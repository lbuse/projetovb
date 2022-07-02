import 'package:json_annotation/json_annotation.dart';

class ProdutoMaisVendido {
  @JsonKey(name: 'id_loja')
  final int idLoja;
  final String loja;
  final String produto;
  @JsonKey(name: 'quantidade_total', fromJson: readInt)
  final int quantidade;

  ProdutoMaisVendido(
    this.idLoja,
    this.loja,
    this.produto,
    this.quantidade,
  );

  static int readInt(String value) => int.parse(value);
}
