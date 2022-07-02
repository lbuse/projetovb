// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_por_mes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaturamentoPorMesModel _$FaturamentoPorMesModelFromJson(
        Map<String, dynamic> json) =>
    FaturamentoPorMesModel(
      json['id_loja'] as int,
      json['loja'] as String,
      json['quantidade_total'] == null
          ? 0
          : FaturamentoPorMes.readInt(json['quantidade_total'] as String),
      json['preco_total'] == null
          ? 0
          : FaturamentoPorMes.readDouble(json['preco_total'] as String),
      json['pessoas_atendidas_total'] == null
          ? 0
          : FaturamentoPorMes.readInt(
              json['pessoas_atendidas_total'] as String),
      json['ticket_medio'] == null
          ? 0
          : FaturamentoPorMes.readDouble(json['ticket_medio'] as String),
      json['mes'] as int,
      json['ano'] as int,
    );
