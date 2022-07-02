import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/grupo.dart';

part 'grupo_model.g.dart';

@JsonSerializable(createToJson: false)
class GrupoModel extends Grupo {
  GrupoModel(super.id, super.nome);

  factory GrupoModel.fromJson(Map<String, dynamic> json) =>
      _$GrupoModelFromJson(json);
}
