// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venda_por_horario_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendaPorHorarioModel _$VendaPorHorarioModelFromJson(
        Map<String, dynamic> json) =>
    VendaPorHorarioModel(
      json['id_loja'] as int,
      json['loja'] as String,
      json['quantidade_total'] == null
          ? 0
          : VendaPorHorario.readInt(json['quantidade_total'] as String),
      json['preco_total'] == null
          ? 0
          : VendaPorHorario.readDouble(json['preco_total'] as String),
      json['pessoas_atendidas_total'] == null
          ? 0
          : VendaPorHorario.readInt(json['pessoas_atendidas_total'] as String),
      VendaPorHorario.utcToLocal(json['data'] as String),
    );
