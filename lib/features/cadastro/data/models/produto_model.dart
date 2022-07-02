import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/produto.dart';

part 'produto_model.g.dart';

@JsonSerializable(createToJson: false)
class ProdutoModel extends Produto {
  ProdutoModel(
    super.id,
    super.idGrupo,
    super.nome,
  );

  factory ProdutoModel.fromJson(Map<String, dynamic> json) =>
      _$ProdutoModelFromJson(json);
}
