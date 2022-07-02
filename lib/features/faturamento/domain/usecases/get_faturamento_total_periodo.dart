import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/faturamento_por_mes.dart';
import '../repositories/faturamento_repository.dart';

class GetFaturamentoTotalPeriodo
    implements Usecase<List<FaturamentoTotal>, Params> {
  final FaturamentoRepository repository;

  GetFaturamentoTotalPeriodo(this.repository);

  @override
  Future<Either<Failure, List<FaturamentoTotal>>> call(
    Params params,
  ) async {
    var response = await repository.getFaturamentoPorMes(
      params.dataInicial,
      params.dataFinal,
      lojas: params.lojas,
    );

    return response.fold(
      (failure) => Left(failure),
      (faturamentos) {
        Map<String, FaturamentoTotal> faturamentoPorLoja = {};

        for (FaturamentoPorMes faturamento in faturamentos) {
          String loja = faturamento.loja;
          bool isNewEntry = false;
          faturamentoPorLoja.putIfAbsent(
            loja,
            () {
              isNewEntry = true;
              return FaturamentoTotal(
                idLoja: faturamento.idLoja,
                loja: loja,
                quantidadeTotal: faturamento.quantidadeTotal,
                valorTotal: faturamento.precoTotal,
                pessoasAtendidasTotal: faturamento.pessoasAtendidasTotal,
              );
            },
          );

          if (!isNewEntry) {
            faturamentoPorLoja[loja]!
              ..quantidadeTotal += faturamento.quantidadeTotal
              ..valorTotal += faturamento.precoTotal
              ..pessoasAtendidasTotal;
          }
        }

        return Right(faturamentoPorLoja.values.toList());
      },
    );
  }
}

class Params {
  final DateTime dataInicial;
  final DateTime dataFinal;
  final List<int>? lojas;

  Params({
    required this.dataInicial,
    required this.dataFinal,
    this.lojas,
  });
}

class FaturamentoTotal {
  final int idLoja;
  final String loja;
  int quantidadeTotal = 0;
  double valorTotal = 0;
  int pessoasAtendidasTotal = 0;

  FaturamentoTotal({
    required this.idLoja,
    required this.loja,
    required this.quantidadeTotal,
    required this.valorTotal,
    required this.pessoasAtendidasTotal,
  });
}
