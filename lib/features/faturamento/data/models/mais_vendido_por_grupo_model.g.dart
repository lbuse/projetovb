// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mais_vendido_por_grupo_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MaisVendidoPorGrupoModel _$MaisVendidoPorGrupoModelFromJson(
        Map<String, dynamic> json) =>
    MaisVendidoPorGrupoModel(
      json['id_loja'] as int,
      json['loja'] as String,
      json['id_grupo'] as int,
      json['grupo'] as String,
      json['quantidade_total'] == null
          ? 1
          : MaisVendidoPorGrupo.readDouble(json['quantidade_total'] as String),
      json['valor_total'] == null
          ? 0
          : MaisVendidoPorGrupo.readDouble(json['valor_total'] as String),
      json['porcentagem'] == null
          ? 0
          : MaisVendidoPorGrupo.readDouble(json['porcentagem'] as String),
    );
