import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/faturamento_por_mes.dart';
import '../repositories/faturamento_repository.dart';

class GetFaturamentoPorMes
    implements Usecase<Map<String, List<FaturamentoPorMes>>, Params> {
  final FaturamentoRepository repository;

  GetFaturamentoPorMes(this.repository);

  @override
  Future<Either<Failure, Map<String, List<FaturamentoPorMes>>>> call(
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
        Map<String, List<FaturamentoPorMes>> faturamentoPorLoja = {};
        for (FaturamentoPorMes faturamento in faturamentos) {
          bool isNewEntry = false;
          String loja = faturamento.loja;
          faturamentoPorLoja.putIfAbsent(
            loja,
            () {
              isNewEntry = true;
              return [faturamento];
            },
          );

          if (!isNewEntry) {
            faturamentoPorLoja[loja]!.add(faturamento);
          }
        }
        return Right(faturamentoPorLoja);
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
