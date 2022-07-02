import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/produto_mais_vendido.dart';
import '../repositories/faturamento_repository.dart';

class GetProdutosMaisVendido
    implements Usecase<List<ProdutoMaisVendido>, Params> {
  final FaturamentoRepository repository;

  GetProdutosMaisVendido(this.repository);

  @override
  Future<Either<Failure, List<ProdutoMaisVendido>>> call(Params params) async {
    return await repository.getProdutoMaisVendido(
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
