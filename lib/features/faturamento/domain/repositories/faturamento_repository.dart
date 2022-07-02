import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../entities/faturamento_por_dia.dart';
import '../entities/faturamento_por_mes.dart';
import '../entities/mais_vendido_por_grupo.dart';
import '../entities/produto_mais_vendido.dart';
import '../entities/venda_por_horario.dart';

abstract class FaturamentoRepository {
  Future<Either<Failure, List<FaturamentoPorMes>>> getFaturamentoPorMes(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  });

  Future<Either<Failure, List<FaturamentoPorDia>>> getFaturamentoPorDia(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  });

  Future<Either<Failure, List<MaisVendidoPorGrupo>>> getMaisVendidoPorGrupos(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  });

  Future<Either<Failure, List<ProdutoMaisVendido>>> getProdutoMaisVendido(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  });

  Future<Either<Failure, List<VendaPorHorario>>> getVendasPorHorario(
    DateTime dataInicial,
    DateTime dataFinal, {
    List<int>? lojas,
  });
}
