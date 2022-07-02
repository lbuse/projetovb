import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/produto_mais_vendido.dart';

part 'produto_mais_vendido_model.g.dart';

@JsonSerializable(createToJson: false)
class ProdutoMaisVendidoModel extends ProdutoMaisVendido {
  ProdutoMaisVendidoModel(
    super.idLoja,
    super.loja,
    super.produto,
    super.quantidade,
  );

  factory ProdutoMaisVendidoModel.fromJson(Map<String, dynamic> json) =>
      _$ProdutoMaisVendidoModelFromJson(json);
}
