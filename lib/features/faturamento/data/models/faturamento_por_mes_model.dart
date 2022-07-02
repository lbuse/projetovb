import 'package:json_annotation/json_annotation.dart';

import '../../domain/entities/faturamento_por_mes.dart';

part 'faturamento_por_mes_model.g.dart';

@JsonSerializable(createToJson: false)
class FaturamentoPorMesModel extends FaturamentoPorMes {
  FaturamentoPorMesModel(
    super.idLoja,
    super.loja,
    super.quantidadeTotal,
    super.precoTotal,
    super.pessoasAtendidasTotal,
    super.ticketMedio,
    super.mes,
    super.ano,
  );

  factory FaturamentoPorMesModel.fromJson(Map<String, dynamic> json) =>
      _$FaturamentoPorMesModelFromJson(json);
}
