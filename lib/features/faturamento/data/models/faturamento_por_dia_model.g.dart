// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'faturamento_por_dia_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaturamentoPorDiaModel _$FaturamentoPorDiaModelFromJson(
        Map<String, dynamic> json) =>
    FaturamentoPorDiaModel(
      json['id_loja'] as int,
      json['loja'] as String,
      json['quantidade_total'] == null
          ? 0
          : FaturamentoPorDia.readInt(json['quantidade_total'] as String),
      json['preco_total'] == null
          ? 0
          : FaturamentoPorDia.readDouble(json['preco_total'] as String),
      json['pessoas_atendidas_total'] == null
          ? 0
          : FaturamentoPorDia.readInt(
              json['pessoas_atendidas_total'] as String),
      json['ticket_medio'] == null
          ? 0
          : FaturamentoPorDia.readDouble(json['ticket_medio'] as String),
      DateTime.parse(json['data'] as String),
    );
