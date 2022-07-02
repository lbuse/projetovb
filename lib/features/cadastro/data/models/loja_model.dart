import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/loja.dart';

part 'loja_model.g.dart';

@JsonSerializable(createToJson: false)
class LojaModel extends Loja {
  LojaModel(
    super.id,
    super.nome,
  );

  factory LojaModel.fromJson(Map<String, dynamic> json) =>
      _$LojaModelFromJson(json);
}
