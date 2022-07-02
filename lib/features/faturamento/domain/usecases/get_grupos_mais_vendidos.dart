import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/mais_vendido_por_grupo.dart';
import '../repositories/faturamento_repository.dart';

class GetGruposMaisVendidos
    implements Usecase<List<MaisVendidoPorGrupo>, Params> {
  final FaturamentoRepository repository;

  GetGruposMaisVendidos(this.repository);

  @override
  Future<Either<Failure, List<MaisVendidoPorGrupo>>> call(Params params) async {
    return await repository.getMaisVendidoPorGrupos(
      params.dataInicial,
      params.dataFinal,
      lojas: [params.idLoja],
    );
  }
}

class Params {
  final DateTime dataInicial;
  final DateTime dataFinal;
  final int idLoja;

  Params({
    required this.dataInicial,
    required this.dataFinal,
    required this.idLoja,
  });
}
