import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/venda_por_horario.dart';

part 'venda_por_horario_model.g.dart';

@JsonSerializable(createToJson: false)
class VendaPorHorarioModel extends VendaPorHorario {
  VendaPorHorarioModel(
    super.idLoja,
    super.loja,
    super.quantidade,
    super.preco,
    super.pessoasAtentidas,
    super.data,
  );

  factory VendaPorHorarioModel.fromJson(Map<String, dynamic> json) =>
      _$VendaPorHorarioModelFromJson(json);
}
