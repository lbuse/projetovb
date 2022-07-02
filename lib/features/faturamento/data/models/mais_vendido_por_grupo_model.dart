import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/mais_vendido_por_grupo.dart';

part 'mais_vendido_por_grupo_model.g.dart';

@JsonSerializable(createToJson: false)
class MaisVendidoPorGrupoModel extends MaisVendidoPorGrupo {
  MaisVendidoPorGrupoModel(
    super.idLoja,
    super.loja,
    super.idGrupo,
    super.grupo,
    super.quantidadeTotal,
    super.valorTotal,
    super.percentual,
  );

  factory MaisVendidoPorGrupoModel.fromJson(Map<String, dynamic> json) =>
      _$MaisVendidoPorGrupoModelFromJson(json);
}
