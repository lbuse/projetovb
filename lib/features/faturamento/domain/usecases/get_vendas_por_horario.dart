import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/venda_por_horario.dart';
import '../repositories/faturamento_repository.dart';

class GetVendasPorHorario implements Usecase<List<VendaPorHorario>, Params> {
  final FaturamentoRepository repository;

  GetVendasPorHorario(this.repository);

  @override
  Future<Either<Failure, List<VendaPorHorario>>> call(Params params) async {
    return await repository.getVendasPorHorario(
      params.dataInicial,
      params.dataFinal,
      lojas: params.lojas,
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
