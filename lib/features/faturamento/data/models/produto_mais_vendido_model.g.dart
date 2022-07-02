// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto_mais_vendido_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutoMaisVendidoModel _$ProdutoMaisVendidoModelFromJson(
        Map<String, dynamic> json) =>
    ProdutoMaisVendidoModel(
      json['id_loja'] as int,
      json['loja'] as String,
      json['produto'] as String,
      ProdutoMaisVendido.readInt(json['quantidade_total'] as String),
    );
