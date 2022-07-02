import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/faturamento_por_dia.dart';

part 'faturamento_por_dia_model.g.dart';

@JsonSerializable(createToJson: false)
class FaturamentoPorDiaModel extends FaturamentoPorDia {
  FaturamentoPorDiaModel(
    super.idLoja,
    super.loja,
    super.quantidadeTotal,
    super.precoTotal,
    super.pessoasAtendidasTotal,
    super.ticketMedio,
    super.data,
  );

  factory FaturamentoPorDiaModel.fromJson(Map<String, dynamic> json) =>
      _$FaturamentoPorDiaModelFromJson(json);
}
