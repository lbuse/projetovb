import 'package:dartz/dartz.dart';

import '../../../../core/models/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/produto.dart';
import '../repositories/produtos_repository.dart';

class GetProdutos implements Usecase<List<Produto>, Params> {
  final ProdutosRepository repository;

  GetProdutos(this.repository);

  @override
  Future<Either<Failure, List<Produto>>> call(Params params) {
    if (params.termo.isEmpty) {
      return repository.getProdutos(ids: params.ids);
    } else {
      return repository.getProdutosPorTermo(params.termo);
    }
  }
}

class Params {
  final List<int>? ids;
  final String termo;

  Params(this.termo, {this.ids});

  factory Params.comIds({List<int>? ids}) => Params('', ids: ids);

  factory Params.comTermo(String termo) => Params(termo);
}
