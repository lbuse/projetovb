import 'package:json_annotation/json_annotation.dart';

class FaturamentoPorDia {
  @JsonKey(name: 'id_loja')
  final int idLoja;

  final String loja;

  @JsonKey(name: 'quantidade_total', defaultValue: 0, fromJson: readInt)
  final int quantidadeTotal;

  @JsonKey(name: 'preco_total', defaultValue: 0, fromJson: readDouble)
  final double precoTotal;

  @JsonKey(name: 'pessoas_atendidas_total', defaultValue: 0, fromJson: readInt)
  final int pessoasAtendidasTotal;

  @JsonKey(name: 'ticket_medio', defaultValue: 0, fromJson: readDouble)
  final double ticketMedio;

  @JsonKey(fromJson: utcToLocal)
  final DateTime data;

  FaturamentoPorDia(
    this.idLoja,
    this.loja,
    this.quantidadeTotal,
    this.precoTotal,
    this.pessoasAtendidasTotal,
    this.ticketMedio,
    this.data,
  );

  static int readInt(String value) => int.parse(value);
  static double readDouble(String value) => double.parse(value);
  static DateTime utcToLocal(String time) => DateTime.parse(time).toLocal();
}
